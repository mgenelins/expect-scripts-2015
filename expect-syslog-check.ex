#!/usr/bin/expect -f
# Perform functions on linux dhcps
log_user 1
set password "?y#%g*!6\n"
set serverid [lindex $argv 0]
set rootpass "415!@#$%!!\n"
set timeout 20

spawn -noecho ssh -oStrictHostKeyChecking=no -o connecttimeout=3 115@$serverid -t "su"
expect "assword:"
send "$password\r"
expect "Password:"
send "$rootpass\r"
expect "# "
send "hostname\r"
expect "# "
send "cat /var/log/auth.log\r"
expect "# "
send "exit\r"
expect eof

