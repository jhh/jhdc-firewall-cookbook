#!/usr/bin/env bats

@test "firewalld running" {
  run firewall-cmd --state
  [ "$status" -eq 0 ]
}

@test "fail2ban running" {
  run fail2ban-client status
  [ "$status" -eq 0 ]
}

@test "sshd jail running" {
  run fail2ban-client status sshd
  [ "$status" -eq 0 ]
}

@test "sshd bantime configured" {
  run fail2ban-client get sshd bantime
  [ "$output" = "3613" ]
}

@test "postfix jail running" {
  run fail2ban-client status postfix
  [ "$status" -eq 0 ]
}
