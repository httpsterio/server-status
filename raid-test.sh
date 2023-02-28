#!/bin/bash

WORKING=$(mdadm -D /dev/md0 | grep "Working" | grep -Eo '[0-9]')
FAILED=$(mdadm -D /dev/md0 | grep "Failed" | grep -Eo '[0-9]')


if (($WORKING != 2));
then
  echo "|" $(date +'%Y-%m-%d') "|" $(date +"%H:%M") "|" "ERROR", $FAILED "failed disks |"  >> /home/makela/scripts/server-status/README.md
else
  echo "|" $(date +'%Y-%m-%d') "|" $(date +"%H:%M") "|" "OK", $WORKING "working disks |"  >> /home/makela/scripts/server-status/README.md
fi
