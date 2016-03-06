default['fail2ban']['services'] = {
  'sshd' => {
    'enabled' => 'true',
    'bantime' => '600' # 10 minutes is fail2ban default
  }
}
