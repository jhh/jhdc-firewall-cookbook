#
# Cookbook Name:: firewall
# Recipe:: default
#
# Copyright (c) 2015 Jeff Hutchison, All Rights Reserved.

include_recipe 'yum-epel::default'

%w(fail2ban fail2ban-server fail2ban-systemd fail2ban-firewalld).each do |p|
  package p do
    action :upgrade
  end
end

service "fail2ban" do
  action [:enable, :start]
end

template "/etc/fail2ban/jail.d/10-local.conf" do
  source "jail.conf.erb"
  mode "0644"
  notifies :restart, "service[fail2ban]"
end
