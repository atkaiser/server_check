#!/bin/sh
# Temp file location
TEMPFILE='/tmp/server_status.txt'
SERVER_NAME='akaiser@akaiser-server.mooo.com'
# Check that you are connected to the internet by seeing if you can
# access google's main page
DESIRED=2
OUTPUT=`curl www.google.com 2>/dev/null | grep "Google Search" | wc -l | tr -d ' '`
if [ "$DESIRED" == "$OUTPUT" ]
then
	echo "The Internet is up"
	# Check if you can access google from your server
	# Check twice to be sure
	for i in {1..2}
	do
		OUTPUT=`ssh -o ConnectTimeout=5 $SERVER_NAME "curl www.google.com 2>/dev/null | grep \"Google Search\" | wc -l | tr -d ' '"`
		if [ "$DESIRED" == "$OUTPUT" ]
		then
			break
		fi
	done
	if [ "$DESIRED" != "$OUTPUT" ]
	then
		if [ -f $TEMPFILE]
		then
			echo "This is the first run" > $TEMPFILE
		fi
		OUTPUT=`cat $TEMPFILE`
		if [ "Up" == "$OUTPUT" ]
		then
			# Send an email
		fi
		echo "Down" > $TEMPFILE
		echo "not OK the server is down"
		for i in {1..3}
		do
			date > "Desktop/THE SERVER IS DOWN $i.txt"
		done
	else
		# Set the last seen status of the server
		echo "Up" > $TEMPFILE
		echo "Server is up"
        date
	fi
else
	echo "Can't connect to the internet"
fi