#!/usr/bin/expect -f
# Perform functions on linux dhcps
log_user 1
set password "?6.**o*u\n"
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
send "scp 'matt@zen.webpass.net:hosts.*' /root/\r"
#expect "yes"
#send "yes\r"
expect "assword: "
send "Edward1234\r"
expect "# "
send "mv /etc/hosts.deny /etc/hosts.deny.old.9-8-2015\r"
expect "# "
send "mv /etc/hosts.allow /etc/hosts.allow.old.9-8-2015\r"
expect "# "
send "cp /root/hosts.allow /etc/hosts.allow\r"
expect "# "
send "cp /root/hosts.deny /etc/hosts.deny\r"
expect "# "
send "cat /etc/hosts.allow\r"
expect "# "
send "cat /etc/hosts.deny\r"
expect "# "
send "/etc/init.d/sshd restart\r"
expect "# "
send "/etc/rc.d/sshd restart\r"
expect "# "
send "exit\r"
expect eof
