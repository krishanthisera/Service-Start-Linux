# Service-Start-Linux-
This shell program will check the status of the given service as the commandline arguments. If a particular service is not up then It will bring up by the checksrv.sh program.

=======================================================================	+
Author ::krishees@gmail.com						                                  +
Features,							                                                	+
Check the status of the given services (as a command line argument) 	  +
and if that particular service is in down status./checksrv.sh <service> +	
program can turn up the particular service.			                      	+
=======================================================================	+
pattern->						                                                		+
./checksrv.sh <service-1> <service-2>.....<service-n>	              		+
ex-> for httpd and mysqld			                                    			+
./checksrv.sh httpd mysqld					                                   	+
=======================================================================	+
Usage->							                                                		+
Using crontab (crontab -e)						                                  +	
* * * * *  ./checksrv.sh <service> 					                            +
Check the status of the service every 60 seconds and if the particular 	+
service not up then the ./checksrv.sh will bring up the particular 	    + 
services 								                                              	+
------------------------------------------------------------------------+
Using inittab	(/etc/inittab)					                                	+
Check the status of a service after particular run-level reset. After 	+
particular run-level change and if particular service is not up then    +
 ./checksrv.sh will bring up  the particular services 		            	+
=======================================================================	+
