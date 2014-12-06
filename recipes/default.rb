#
# Cookbook Name:: pi-motion
# Recipe:: default
#
# Copyright (C) 2014 Dave Cozzolino @davecozzo
# 
# All rights reserved - Do Not Redistribute
#

node['pi-motion']['motion-packages'].each do |pkg|
  package pkg do
  action :install
  end
end

directory node['pi-motion']['target-dir'] do
  owner node['pi-motion']['user']
  group node['pi-motion']['group']
  action :create
end

template '/etc/motion/motion.conf' do
  source 'motion.conf.erb'
  mode '0640'
  owner 'root'
  group node['pi-motion']['group']
  notifies :restart, 'service[motion]', :delayed
end

template '/etc/default/motion' do
  source 'default-motion.erb'
  mode '0644'
  owner 'root'
  group 'root'
end

template '/etc/init.d/motion' do
  source 'motion-service.erb'
  mode '0755'
  owner 'root'
  group 'root' 
end

if node['pi-motion']['enable-on_movie_end']
  node['pi-motion']['mail-packages'].each do |pkg|
    package pkg do
    action :install
    end
  end

  ruby_block "create-#{node['pi-motion']['user']}-home" do
    block do
      homedir = Mixlib::ShellOut.new("echo ~#{node['pi-motion']['user']}").run_command.stdout.chomp.strip
      ::FileUtils.mkdir_p(homedir)
      ::FileUtils.chown(node['pi-motion']['user'], node['pi-motion']['group'], homedir)
    end
    not_if { ::File.directory?( Mixlib::ShellOut.new("echo ~#{node['pi-motion']['user']}").run_command.stdout.chomp.strip ) }
  end

  execute 'create-mailname' do
    command 'hostname --fqdn > /etc/mailname'
    not_if { ::File.exists?('/etc/mailname') }
    notifies :restart, 'service[postfix]', :delayed
  end

  template '/etc/postfix/main.cf' do
    source 'main.cf.erb'
    mode '0644'
    owner 'root'
    group 'root'
    notifies :restart, 'service[postfix]', :delayed
  end

  template '/etc/postfix/sasl_passwd' do
    source 'sasl_passwd.erb'
    mode '0600'
    owner 'root'
    group 'root' 
    notifies :run, 'execute[update-sasl-password.db]', :immediately
    notifies :restart, 'service[postfix]', :delayed
  end

  execute 'update-sasl-password.db' do
    command 'postmap /etc/postfix/sasl_passwd'
    cwd '/etc/postfix'
    action :nothing
    notifies :restart, 'service[postfix]', :delayed
  end

  service 'postfix' do
    supports :restart => true, :reload => true, :status => true
    action [ :enable, :start ]
  end
end

service 'motion' do
  supports :restart => true, :reload => true, :status => false
  action [ :enable, :start ]
end

execute "delete-files-older-than-#{node['pi-motion']['delete-after']}-days" do
  command "find #{node['pi-motion']['target-dir']} -type f -mtime +#{node['pi-motion']['delete-after']} -exec rm {} \\;"
  only_if { node['pi-motion']['delete-old-files'] }
end
