require 'spec_helper'

describe 'jhdc-firewall::fail2ban' do
  let(:chef_run) { ChefSpec::SoloRunner.converge('jhdc-firewall::fail2ban') }

  %w(fail2ban fail2ban-server fail2ban-systemd
     fail2ban-firewalld).each do |package|
    it "installs #{package}" do
      expect(chef_run).to upgrade_package(package)
    end
  end

  it 'enables and starts fail2ban servers' do
    expect(chef_run).to enable_service('fail2ban')
    expect(chef_run).to start_service('fail2ban')
  end

  it 'creates local jail file' do
    conf = '/etc/fail2ban/jail.d/10-local.conf'
    expect(chef_run).to render_file(conf).with_content(/^enabled = true$/)
    expect(chef_run).to render_file(conf).with_content(/^bantime = \d+$/)
  end
end
