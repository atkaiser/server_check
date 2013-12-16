server_check
============

This is a script to check if a server is up.  You can use it if you want but you'll have to change some of the variables.  Right now I tell it to create a file on the desktop if the server is down.  In the future I will have it send an email when the script first notices that the server is down. To use you will usually want to install it to run as a cron script in the background.  The line I use is:

	*/5 * * * * bash --login -c test_server_up.sh > log.txt 2>&1

Which runs the script every 5 minutes. To get it working you'll need to change the `SERVER_NAME` variable in the script.  You'll also need to set up ssh access without a password (<http://www.linuxproblem.org/art_9.html> is a good resource).  If you have any problems you can add an issue to the github repo.  If you have any comments you can email me at completekaiser[AT]gmail[DOT]com.  Thanks.
