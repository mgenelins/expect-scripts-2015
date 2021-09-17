#!/usr/bin/expect -f
# Perform functions on linux dhcps
log_user 1
set password "#6-%h%%6\n"
set serverid [lindex $argv 0]
set rootpass "415!@#$%!!\n"
set timeout 20

spawn -noecho ssh -oStrictHostKeyChecking=no -o connecttimeout=3 115@$serverid -t "su"
sleep 1
expect "assword:"
send "$password"
expect "Password:"
send "$rootpass\n"
expect "# "
send "hostname\r"
expect "# "
send "ls -l /usr/local/dhcpstatus/\r"
expect "# "
send "dhcpstatus\r"
expect "# "
send "hostname\r"
expect "# "

send "\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r"
expect "# "

send "exit\r"
expect eof
