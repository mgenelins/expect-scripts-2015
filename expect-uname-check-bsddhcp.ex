#!/usr/bin/expect -f
# Perform functions on bsd dhcp46's 
log_user 1
set password "hmvdu54.\n"
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
send "uname -a\r"
expect "# "
send "exit\r"
expect eof

