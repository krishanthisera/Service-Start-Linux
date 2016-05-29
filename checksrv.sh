#!/bin/bash
echo "
=======================================================================	+
Author ::krishees@gmail.com						+
Features,								+
Check the status of the given services (as a command line argument) 	+
and if that particular service is in down status./checksrv.sh <service> +	
program can turn up the particular service.				+
=======================================================================	+
pattern->								+
./checksrv.sh <service-1> <service-2>.....<service-n>			+
ex-> for httpd and mysqld						+
./checksrv.sh httpd mysqld						+
=======================================================================	+
Usage->									+
Using crontab (crontab -e)						+	
* * * * *  ./checksrv.sh <service> 					+
Check the status of the service every 60 seconds and if the particular 	+
service not up then the ./checksrv.sh will bring up the particular 	+ 
services 									+
------------------------------------------------------------------------+
Using inittab	(/etc/inittab)						+
Check the status of a service after particular run-level reset. After 	+
particular run-level change and if particular service is not up then    +
 ./checksrv.sh will bring up  the particular services 			+
=======================================================================	+
"
if [ "$#" = 0 ]
then
echo "Usage $0 <service>"
exit 1
fi
 
for i;do
service=$i
is_running=`ps aux | grep -v grep| grep -v "$0" | grep $service| wc -l | awk '{print $1}'`
if [ $is_running != "0" ] ;
then
echo "Nothing to do!!! $service Service  is already up and running...."
else
echo
initd=`ls /etc/init.d/ | grep $service | wc -l | awk '{ print $i }'`
if [ $initd = "1" ];
then
startup=`ls /etc/init.d/ | grep $service`
echo "
=======================================================================
		       	     $i
======================================================================="
echo "Waiting for service $i..."
/etc/init.d/${startup} start
else
echo "$i No such a service!!!"
fi
fi
done
