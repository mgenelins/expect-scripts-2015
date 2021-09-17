#!/usr/bin/expect -f
log_user 1
set password "8?af2.a-\n"
set serverid [lindex $argv 0]
set rootpass "415!@#$%!!\n"
set timeout 120

spawn -noecho ssh -oStrictHostKeyChecking=no -o connecttimeout=3 115@$serverid 
expect "assword:"
send "$password\r"
expect "$ "
send "date\r"
expect "$ "
send "hostname\r"
expect "$ "
send "exit\r"
expect eof
