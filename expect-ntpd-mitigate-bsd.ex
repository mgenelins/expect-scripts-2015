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
send "cat <<EOF >> /etc/ntp.conf\r \

#
# Mitigation for the NTP reflection attack. 7-7-2015 per Blake - added by Matt
#
restrict -4 default nomodify nopeer noquery notrap
restrict -6 default nomodify nopeer noquery notrap
disable monitor
restrict 127.0.0.1
restrict ::1
 
#
# Mitigation for the NTP reflection attack END. 7-7-2015 per Blake - added by Matt
#
EOF\r\r"

expect "# "
send "/etc/rc.d/ntpd restart\r"
expect "# "
send "ntpdc -n -c monlist localhost\r"
expect "# "

send "exit\r"
expect eof

