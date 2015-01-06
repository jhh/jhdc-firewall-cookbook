#!/usr/bin/env bats

@test "firewalld running" {
  run firewall-cmd --state
  [ "$status" -eq 0 ]
}

@test "fail2ban running" {
  run fail2ban-client status
  [ "$status" -eq 0 ]
}
