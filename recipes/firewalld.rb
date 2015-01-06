#
# Cookbook Name:: firewall
# Recipe:: firewalld
#
# Copyright (c) 2015 Jeff Hutchison, All Rights Reserved.

package 'firewalld' do
  action :upgrade
end

service "firewalld" do
  action [:enable, :start]
end
