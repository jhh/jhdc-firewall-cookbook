#
# Cookbook Name:: firewall
# Recipe:: default
#
# Copyright (c) 2015 Jeff Hutchison, All Rights Reserved.

include_recipe 'jhdc-firewall::firewalld'
include_recipe 'jhdc-firewall::fail2ban'
