actions :add, :remove
default_action :add

attribute :port,     :kind_of => Integer, :name_attribute => true
attribute :protocol, :kind_of => String,  :default => 'tcp'
attribute :zone,     :kind_of => String
