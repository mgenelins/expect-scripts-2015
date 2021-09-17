#!/usr/bin/expect -f
# Perform functions on linux dhcps
log_user 1
set password "jmzkbz%2\n"
set serverid [lindex $argv 0]
set rootpass "415!@#$%!!\n"
set timeout 120

spawn -noecho ssh -oStrictHostKeyChecking=no -o connecttimeout=3 115@$serverid -t "su"
expect "assword:"
send "$password\r"
expect "Password:"
send "$rootpass\r"
expect "# "
send "hostname\r"
expect "# "
send "ntpdc -n -c monlist localhost\r"
expect "# "
send "grep \"restrict\" /etc/ntp.conf\r"
expect "# "
send "grep \"disable monitor\" /etc/ntp.conf\r"
expect "# "
send "exit\r"
expect eof

