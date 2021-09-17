#!/bin/bash 
# Daily-run=exp[ect-dhcpstat-check.sh - a shell script that checks the daily status of all dhcp and dhcp46 boxes
#                 as defined in 'bsddhcp' and 'lindhcp' in /home/matt/. Checks each host, logging the 
#                 EXPECT transaction. Then takes log file and parses for non-compliant hosts. 
#                 Non-compliant hosts are emailed to systems@webpass.net at 8:00am daly.
# Matt Genelin - Webpass - August 7, 2015.
#


# Remove yesterday's file:
rm -f ./daily-run-expect-dhcpstatus-check.log

for host in $(cat allHosts.txt)
do
	./expect-dhcpstatus-check.ex "$host" >> ./daily-run-expect-dhcpstatus-check.log
done

# Parse the file:

grep "No such file or directory" daily-run-expect-dhcpstatus-check.log -b3 |grep -v "hostname" | grep -v "ls -l" | grep -v "cannot access" | grep -v "command not found" |grep -v "dhcpstatus" > non-compliant-hosts.txt

# mail -s Daily-
