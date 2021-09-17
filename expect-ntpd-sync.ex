#!/usr/bin/expect -f
log_user 1
set password "=929?2i!\n"
set serverid [lindex $argv 0]
set rootpass "415!@#$%!!\n"
set timeout 120

spawn -noecho ssh -oStrictHostKeyChecking=no -o connecttimeout=3 115@$serverid -t "su"
expect "assword:"
send "$password\r"
expect "Password:"
send "$rootpass\r"
expect "# "
send "/etc/rc.d/ntpd stop\r"
expect "# "
send "/etc/init.d/ntp stop\r"
expect "# "
send "ntpdate 204.14.152.10\r"
expect "# "
send "hostname\r"
expect "# "
send "cp /etc/ntp.conf /etc/ntp.conf.old\r"
expect "# "
send "cat >> /etc/ntp.conf <<EOF
# Webpass config:
server 204.14.152.10
/etc/rc.d/netif restart
/etc/rc.d/routing restart

# server 0.pool.ntp.org
# server 1.pool.ntp.org
# server 2.pool.ntp.org
# server 3.pool.ntp.org


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
EOF
\r"
expect "# "
send "/etc/rc.d/ntpd start\r"
expect "# "
send "/etc/init.d/ntp start\r"
expect "# "
send "hostname\r"
expect "# "
send "exit\r"
expect eof
