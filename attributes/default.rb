default['fail2ban']['services'] = {
  'sshd' => {
    'enabled' => 'true',
    'bantime' => "#{10 * 60}" # 10 minutes is fail2ban default
  }
}
