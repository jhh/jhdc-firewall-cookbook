module FirewallUtilities
  def write_jail_conf(service, sequence, enabled)
    template "/etc/fail2ban/jail.d/#{sequence}-#{service}.conf" do
      source "fail2ban.conf.erb"
      variables({
        :service => service,
        :enabled => enabled ? 'true' : 'false'
        })
        mode "0644"
        notifies :reload, "service[fail2ban]", :delayed
      end
    end
end
