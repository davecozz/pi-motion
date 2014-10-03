#
# Cookbook Name:: pi-motion
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

group 'pi' do
  gid '1000'
end

user 'pi' do
  uid '1000'
  gid 'pi'
  home '/home/pi'
end

node['pi-motion']['packages'].each do |pkg|
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

execute 'create-mailname' do
  command 'hostname --fqdn > /etc/mailname'
  not_if { ::File.exists?('/etc/mailname') }
  notifies :restart, 'service[postfix]', :delayed
end

execute 'update-sasl-password.db' do
  command 'postmap /etc/postfix/sasl_passwd'
  cwd '/etc/postfix'
  action :nothing
  notifies :restart, 'service[postfix]', :delayed
end

#ruby_block 'update-cacerts.pem' do
#  block do
#    if ::File.exists?('/etc/postfix/cacert.pem')
#      @cacert = ::File.readlines('/etc/ssl/certs/Thawte_Premium_Server_CA.pem')
#      @cafile = ::File.readlines('/etc/postfix/cacert.pem')
#      unless @cafile & @cacert == @cacert
#        ::File.open('/etc/postfix/cacert.pem', 'a') { |f| f.write(@cacert) }
#      end
#    else
#      ::File.open('/etc/postfix/cacert.pem', 'w') { |f| f.write(@cacert) }
#    end
#  end
#  notifies :restart, 'service[postfix]', :delayed
#end

service 'postfix' do
  supports :restart => true, :reload => true, :status => true
  action [ :enable, :start ]
end

service 'motion' do
  supports :restart => true, :reload => true, :status => false
  action [ :enable, :start ]
end
