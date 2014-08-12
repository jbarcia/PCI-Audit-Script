#!/bin/bash
version=1.3
# NYC Office, implementing new techniques and strategies to conquer the world!!!!
# Copyright - Joseph Barcia

# Added Directory Structure and Requirement Numbers






#              a8888b.
#             d888888b.
#             8P"YP"Y88
#             8|o||o|88
#             8'    .88
#             8`._.' Y8.
#            d/      `8b.
#          .dP   .     Y8b.
#         d8:'   "   `::88b.
#        d8"           `Y88b
#       :8P     '       :888
#        8a.    :      _a88P
#      ._/"Yaa_ :    .| 88P|
#      \    YP"      `| 8P  `.
#      /     \._____.d|    .'
#      `--..__)888888P`._.'




















# Scrolling, scrolling, scrolling...keep that mouse wheel rolling....












# Needed Variables - DO NOT CHANGE
# ******************************************************************************
fdate=`date +%m.%d.%y-%k.%M`
# echo $fdate
USERPROFILE=$(eval echo ~${SUDO_USER})
# ******************************************************************************


clear
echo '  _____          ______'
echo ' / ___/__  ___ _/ / _(_)______'
echo '/ /__/ _ \/ _ `/ / _/ / __/ -_)'
echo '\___/\___/\_,_/_/_//_/_/  \__/'
echo; echo;
echo 					PCI 2.0 Audit V_$version
echo --------------------------------------------------

echo Enter Site Name
read SiteName

#Create a temp directory
#If having issues creating the directory, hard code where you would like the files stored
tempdir=$USERPROFILE/Desktop/$fdate-$SiteName-$HOSTNAME

if [ -d "$tempdir" ]; then
	echo *****WARNING: $tempdir already exists rename the folder to prevent data loss*****
fi

if [ ! -d "$tempdir" ]; then
	mkdir "$tempdir"
fi

# Lets make some directories...
	mkdir "$tempdir/Applications"
	mkdir "$tempdir/ScheduleJobs"
	mkdir "$tempdir/Network"
	mkdir "$tempdir/Firewall"
	mkdir "$tempdir/Req 2"
	mkdir "$tempdir/Req 6"
	mkdir "$tempdir/Req 8"
	mkdir "$tempdir/Req 10"

cd "$USERPROFILE/$filedir/"

echo --------------------------------------------------
echo  Grabbing Current User
echo --------------------------------------------------
	whoami >> "$tempdir/Req 8/8.1 $HOSTNAME Current User.txt"
echo --------------------------------------------------
echo  Grabbing Users
echo --------------------------------------------------
	cat /etc/passwd | cut -d: -f1,5 >> "$tempdir/Req 8/8.1 $HOSTNAME Users.txt"
	cat /etc/shadow | cut -d: -f2 | cut -d$ -f 2 >> "$tempdir/Req 8/8.1 $HOSTNAME Users 2.txt"
#	cat /etc/shadow | cut -d: -f1 >> "$tempdir/Req 8/8.1 $HOSTNAME Users 2.txt"
	last >> "$tempdir/Req 8/8.1 $HOSTNAME Last Users Connected.txt"
	w >> "$tempdir/Req 8/8.1 $HOSTNAME Last Users Connected 2.txt"
	cat /etc/group | cut -d: -f1 >> "$tempdir/Req 8/8.1 $HOSTNAME Groups.txt"
echo --------------------------------------------------
echo  Grabbing Administrators
echo --------------------------------------------------
	cat /etc/sudoers >> "$tempdir/Req 8/8.1 $HOSTNAME Administrators.txt"
	grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1}' >> "$tempdir/Req 8/8.1 $HOSTNAME Administrators 2.txt"
	awk -F: '($3 == "0") {print}' /etc/passwd >> "$tempdir/Req 8/8.1 $HOSTNAME Administrators 3.txt"
echo --------------------------------------------------
echo  Grabbing Password Encryption
echo --------------------------------------------------
		cat /etc/shadow  | cut -d: -f2 >> "$tempdir/Req 8/8.4 $HOSTNAME Password Encryption.txt"
echo --------------------------------------------------
echo  Grabbing Network Configuration
echo --------------------------------------------------
	cat /etc/hosts >> "$tempdir/Network/$HOSTNAME Hosts.txt"
	/sbin/ifconfig -a  >> "$tempdir/Network/$HOSTNAME Network Configurations.txt"
	cat /etc/network/interfaces >> "$tempdir/Network/$HOSTNAME Network Configurations 2.txt"
	cat /etc/sysconfig/network >> "$tempdir/Network/$HOSTNAME Configurations 3.txt"
	cat /etc/resolv.conf >> "$tempdir/Network/$HOSTNAME DNS Configurations.txt"
	cat /etc/networks >> "$tempdir/Network/$HOSTNAME Configurations 4.txt"
	hostname >> "$tempdir/Network/$HOSTNAME Hostname.txt"
	dnsdomainname >> "$tempdir/Network/$HOSTNAME Domain Name.txt"
echo --------------------------------------------------
echo  Grabbing Distribution
echo --------------------------------------------------
	cat /etc/issue >> "$tempdir/Req 6/6.1 $HOSTNAME Distribution.txt"
	cat /etc/*-release >> "$tempdir/Req 6/6.1 $HOSTNAME Distribution 2.txt"
	cat /etc/lsb-release >> "$tempdir/Req 6/6.1 $HOSTNAME Distribution 3.txt"
	cat /etc/redhat-release >> "$tempdir/Req 6/6.1 $HOSTNAME Distribution 4.txt"
echo --------------------------------------------------
echo  Grabbing Kernel Version
echo --------------------------------------------------
	cat /proc/version >> "$tempdir/Req 6/6.1 $HOSTNAME Kernel.txt"
	uname -a >> "$tempdir/Req 6/6.1 $HOSTNAME Kernel 2.txt"
	uname -mrs >> "$tempdir/Req 6/6.1 $HOSTNAME Kernel 3.txt"
	rpm -q kernel >> "$tempdir/Req 6/6.1 $HOSTNAME Kernel 4.txt"
	dmesg | grep Linux >> "$tempdir/Req 6/6.1 $HOSTNAME Kernel 5.txt"
	ls /boot | grep vmlinuz- >> "$tempdir/Req 6/6.1 $HOSTNAME Kernel 6.txt"
echo --------------------------------------------------
echo  Grabbing Running Services
echo --------------------------------------------------
	ps aux >> "$tempdir/Req 2/2.2.2 $HOSTNAME Running Services.txt"
	ps -ef >> "$tempdir/Req 2/2.2.2 $HOSTNAME Running Services 2.txt"
	cat /etc/service >> "$tempdir/Req 2/2.2.2 $HOSTNAME Running Services 3.txt"
echo --------------------------------------------------
echo  Grabbing Applications
echo --------------------------------------------------
	dpkg -l >> "$tempdir/Applications/$HOSTNAME Applications.txt"
	rpm -qa >> "$tempdir/Applications/$HOSTNAME Applications 2.txt"
	ls -alh /usr/bin/ >> "$tempdir/Applications/$HOSTNAME Applications 3.txt"
	ls -alh /sbin/ >> "$tempdir/Applications/$HOSTNAME Applications 4.txt"
	ls -alh /var/cache/apt/archivesO >> "$tempdir/Applications/$HOSTNAME Applications 5.txt"
	ls -alh /var/cache/yum/ >> "$tempdir/Applications/$HOSTNAME Applications6.txt"
echo --------------------------------------------------
echo  Grabbing Listening Services
echo --------------------------------------------------
	netstat -antup >> "$tempdir/Req 2/2.2.2 $HOSTNAME Listening Services.txt"
	netstat -antpx >> "$tempdir/Req 2/2.2.2 $HOSTNAME Listening Services 2.txt"
	netstat -tulpn >> "$tempdir/Req 2/2.2.2 $HOSTNAME Listening Services 3.txt"
	lsof -i >> "$tempdir/Req 2/2.2.2 $HOSTNAME Listening Services 4.txt"
	lsof -i :23 >> "$tempdir/Req 2/2.2.2 $HOSTNAME Listening Services Telnet.txt"
	grep 23 /etc/services >> "$tempdir/Req 2/2.2.2 $HOSTNAME Listening Services Telnet 2.txt"
	lsof -i :21 >> "$tempdir/Req 2/2.2.2 $HOSTNAME Listening FTP 2.txt"
	grep 21 /etc/services >> "$tempdir/Req 2/2.2.2 $HOSTNAME Listening FTP.txt"
	chkconfig --list >> "$tempdir/Req 2/2.2.2 $HOSTNAME Listening Services 5.txt"
	chkconfig --list | grep 3:on >> "$tempdir/Req 2/2.2.2 $HOSTNAME Listening Services 6.txt"
echo --------------------------------------------------
echo  Grabbing Scheduled Jobs
echo --------------------------------------------------
	crontab -l >> "$tempdir/ScheduleJobs/$HOSTNAME Scheduled Jobs.txt"
	ls -alh /var/spool/cron >> "$tempdir/ScheduleJobs/$HOSTNAME Scheduled Jobs 2.txt"
	ls -al /etc/ | grep cron >> "$tempdir/ScheduleJobs/$HOSTNAME Scheduled Jobs 3.txt"
	ls -al /etc/cron* >> "$tempdir/ScheduleJobs/$HOSTNAME Scheduled Jobs 4.txt"
	cat /etc/cron* >> "$tempdir/ScheduleJobs/$HOSTNAME Scheduled Jobs 5.txt"
        ls /etc/cron* >> "$tempdir/ScheduleJobs/$HOSTNAME Scheduled Jobs 5.txt"
	cat /etc/at.allow >> "$tempdir/ScheduleJobs/$HOSTNAME Scheduled Jobs 6.txt"
	cat /etc/at.deny >> "$tempdir/ScheduleJobs/$HOSTNAME Scheduled Jobs 7.txt"
	cat /etc/cron.allow >> "$tempdir/ScheduleJobs/$HOSTNAME Scheduled Jobs 8.txt"
	cat /etc/cron.deny >> "$tempdir/ScheduleJobs/$HOSTNAME Scheduled Jobs 9.txt"
	cat /etc/crontab >> "$tempdir/ScheduleJobs/$HOSTNAME Scheduled Jobs 10.txt"
	cat /etc/anacrontab >> "$tempdir/ScheduleJobs/$HOSTNAME Scheduled Jobs 11.txt"
	cat /var/spool/cron/crontabs/root >> "$tempdir/ScheduleJobs/$HOSTNAME Scheduled Jobs 12.txt"
echo --------------------------------------------------
echo  Grabbing Local Firewall Rules
echo --------------------------------------------------
	iptables -L >> "$tempdir/Firewall/$HOSTNAME Firewall Rules.txt"
echo --------------------------------------------------
echo  Grabbing Password Requirements
echo --------------------------------------------------
	cat /etc/pam.d/system-auth >> "$tempdir/Req 8/8.5 $HOSTNAME Password Conf.txt"
	cat /etc/pam.d/common-password >> "$tempdir/Req 8/8.5 $HOSTNAME Password Conf 2.txt"
	cat /etc/login.defs >> "$tempdir/Req 8/8.5 $HOSTNAME Password Conf 3.txt"
	grep password /etc/pam.d/system-auth >> "$tempdir/Req 8/8.5 $HOSTNAME Password Settings.txt"
	grep password /etc/pam.d/common-password >> "$tempdir/Req 8/8.5 $HOSTNAME Password Settings 2.txt"
	grep password /etc/pam.d/system-auth >> "$tempdir/Req 8/8.5 $HOSTNAME Password Settings 3.txt"
echo --------------------------------------------------
echo  Grabbing NTP Settings
echo --------------------------------------------------
	cat /etc/ntp.conf >> "$tempdir/Req 10/10.4 $HOSTNAME ntp config.txt"
	cat /etc/xntp.conf >> "$tempdir/Req 10/10.4 $HOSTNAME ntp config 2.txt"
echo --------------------------------------------------
echo  Grabbing Logging Settings
echo --------------------------------------------------	
	cat /etc/rsyslog.conf >> "$tempdir/Req 10/10.1 $HOSTNAME Log Settings.txt"
	cat /etc/syslog.conf >> "$tempdir/Req 10/10.1 $HOSTNAME Log Settings 2.txt"
	cat /etc/rsyslog.d/* >> "$tempdir/Req 10/10.1 $HOSTNAME Log Settings 3.txt"
	cat /var/log/syslog >> "$tempdir/Req 10/10.1 $HOSTNAME System Log.txt"
	cat /var/log/auth.log >> "$tempdir/Req 10/10.1 $HOSTNAME Authentication Log.txt"
	cat /var/log/secure >> "$tempdir/Req 10/10.1 $HOSTNAME Admin Log.txt"
echo --------------------------------------------------
echo  Packaging up the Files
echo --------------------------------------------------
	tar cvzf "$tempdir.tar.gz" "$tempdir/"
	rm -rf "$tempdir"
echo .
echo ..
echo ...
echo ....
echo Please upload "$tempdir.tar.gz" to the Coalfire portal.
read -p "Press [Enter] key to continue..."

exit
