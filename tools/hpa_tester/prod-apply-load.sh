#!/bin/bash
echo "The load will be applied to the fronend app for 3 Minutes"
siege -c 1000 -t 3M http://guestbook.mstakx.io/guestbook > /dev/null 2>&1
