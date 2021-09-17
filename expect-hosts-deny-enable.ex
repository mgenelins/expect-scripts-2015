#!/usr/bin/expect -f
# Perform functions on linux dhcps
log_user 1
set password "oqj3re9#\n"
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
send "cat /etc/hosts.allow\r"
expect "# "
send "cat /etc/hosts.deny\r"
expect "# "
send "sed -i ' s/^# sshd:/sshd:/g' /etc/hosts.deny\r"
expect "# "
send "cat /etc/hosts.deny\r"
expect "# "
send "/etc/init.d/ssh restart\r"
expect "# "
send "/etc/rc.d/ssh restart\r"
expect "# "
send "hostname\r"
expect "# "
send "\r\r\r\r\r\r\r\r"
expect "# "

send "exit\r"
expect eof
