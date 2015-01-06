#
# Cookbook Name:: firewall
# Recipe:: default
#
# Copyright 2015, Jeff Hutchison
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
