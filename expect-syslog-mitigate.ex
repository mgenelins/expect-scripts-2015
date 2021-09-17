#!/usr/bin/expect -f
# Perform functions on linux dhcps
log_user 1
set password "\$mz==c82\n"
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
send "scp matt@zen.webpass.net:hosts.deny /root/\r"
expect "assword: "
send "Edward1234\r"
expect "# "
send "mv /etc/hosts.deny /etc/hosts.deny.old.7-30-2015\r"
expect "# "
send "cat /etc/hosts.deny /root/hosts.deny > /etc/hosts.deny\r"
send "ls -ltr /etc/hosts.deny\r"
expect "# "
send "cat /etc/hosts.deny\r"
expect "# "
send "rm /root/hosts.deny\r"
expect "# "
send "exit\r"
expect eof
