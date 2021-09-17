#!/bin/tcsh
# install-dhcpstatus.sh - a quick script to install dhcpstatus on a DHCP or DHCP46.x server for
#                         Webpass
#
# Matt Genelin - August 5, 2015 - Initial version

set userid="115"

mkdir -p /usr/local/dhcpstatus
mkdir -p /usr/local/lib/perl5/5.16
mkdir -p /usr/local/lib/perl5/site_perl/5.16
rsync -av $userid@dhcp46.100northbiscayne.mi.web-pass.com:/usr/local/dhcpstatus/ /usr/local/dhcpstatus
rsync -av $userid@dhcp46.100northbiscayne.mi.web-pass.com:/usr/local/lib/perl5/5.16/ /usr/local/lib/perl5/5.16
rsync -av $userid@dhcp46.100northbiscayne.mi.web-pass.com:/usr/local/lib/perl5/site_perl/5.16/ /usr/local/lib/perl5/site_perl/5.16
scp $userid@dhcp46.100northbiscayne.mi.web-pass.com:/usr/local/bin/dhcpstatus /usr/local/bin


