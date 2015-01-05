package 'firewalld'

service "firewalld" do
  action [:enable, :start]
end
