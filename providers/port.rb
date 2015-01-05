action :add do
  zone = ''
  if new_resource.zone
    zone = " --zone=#{new_resource.zone}"
  end

  e = execute 'open firewall port' do
    not_if "firewall-cmd --permanent#{zone} --query-port=#{new_resource.port}/#{new_resource.protocol}"
    command "firewall-cmd --permanent#{zone} --add-port=#{new_resource.port}/#{new_resource.protocol}"
    notifies :restart, 'service[firewalld]'
  end
  new_resource.updated_by_last_action(true) if e.updated_by_last_action?
end

action :remove do
  zone = ''
  if new_resource.zone
    zone = " --zone=#{new_resource.zone}"
  end

  e = execute 'block firewall port' do
    only_if "firewall-cmd --permanent#{zone} --query-port=#{new_resource.port}/#{new_resource.protocol}"
    command "firewall-cmd --permanent#{zone} --remove-port=#{new_resource.port}/#{new_resource.protocol}"
    notifies :restart, 'service[firewalld]'
  end
  new_resource.updated_by_last_action(true) if e.updated_by_last_action?
end
