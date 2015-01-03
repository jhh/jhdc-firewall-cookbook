#
# Cookbook Name:: firewall
# Recipe:: default
#
# Copyright (c) 2015 Jeff Hutchison, All Rights Reserved.

::Chef::Recipe.send(:include, FirewallUtilities)

package 'firewalld'

service "firewalld" do
  action [:enable, :start]
end

include_recipe 'yum-epel::default'

package 'fail2ban'
package 'fail2ban-server'
package 'fail2ban-systemd'
package 'fail2ban-firewalld'

service "fail2ban" do
  action [:enable, :start]
end

write_jail_conf("sshd", 10, true)
