#
# Cookbook Name:: firewall
# Resource:: service
#
# Copyright (c) 2014 Jeff Hutchison, All Rights Reserved.

actions :enable, :disable
default_action :enable

attribute :name, kind_of: String, name_attribute: true
