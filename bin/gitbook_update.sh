#!/bin/bash
# source /etc/profile
# source /home/huangwj/.bash_profile
date
cd /private/var/www/clark-xm.xyz/gitbook
git pull
gitbook install
gitbook build