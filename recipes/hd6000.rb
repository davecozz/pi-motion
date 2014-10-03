#
# Cookbook Name:: pi-motion
# Recipe:: hd6000
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

execute 'set-hd6000-auto-exposure' do
  command "uvcdynctrl --set 'Exposure, Auto' #{node['pi-motion']['hd6000']['auto-exposure']}"
  action :run
  not_if { Mixlib::ShellOut.new("uvcdynctrl --get 'Exposure, Auto'").run_command.stdout.strip.chomp == node['pi-motion']['hd6000']['auto-exposure'] }
  notifies :restart, 'service[motion]', :delayed
end

execute 'set-hd6000-auto-focus' do
  command "uvcdynctrl --set 'Focus, Auto' #{node['pi-motion']['hd6000']['auto-focus']}"
  action :run
  not_if { Mixlib::ShellOut.new("uvcdynctrl --get 'Focus, Auto'").run_command.stdout.strip.chomp == node['pi-motion']['hd6000']['auto-focus'] }
  notifies :restart, 'service[motion]', :delayed
end

execute 'set-hd6000-absolute-focus' do
  command "uvcdynctrl --set 'Focus (absolute)' #{node['pi-motion']['hd6000']['absolute-focus']}"
  action :run
  not_if { Mixlib::ShellOut.new("uvcdynctrl --get 'Focus (absolute)'").run_command.stdout.strip.chomp == node['pi-motion']['hd6000']['absolute-focus'] }
  notifies :restart, 'service[motion]', :delayed
end

execute 'set-hd6000-auto-wb' do
  command "uvcdynctrl --set 'White Balance Temperature, Auto' #{node['pi-motion']['hd6000']['auto-wb']}"
  action :run
  not_if { Mixlib::ShellOut.new("uvcdynctrl --get 'White Balance Temperature, Auto'").run_command.stdout.strip.chomp == node['pi-motion']['hd6000']['auto-wb'] }
  notifies :restart, 'service[motion]', :delayed
end

service 'motion' do
  supports :start => true, :stop => true, :restart => true, :reload => true
  action :enable
end

