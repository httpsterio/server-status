#!/bin/bash

WORKING=$(mdadm -D /dev/md0 | grep "Working" | grep -Eo '[0-9]')
FAILED=$(mdadm -D /dev/md0 | grep "Failed" | grep -Eo '[0-9]')

#echo $(date +"%F %T") >> makela.md

#echo "|" $(date +'%Y-%m-%d') "|" $(date +"%H:%M") "|" >> makela.md

if (($WORKING != 2));
then
  echo "|" $(date +'%Y-%m-%d') "|" $(date +"%H:%M") "|" "ERROR", $FAILED "failed disks |"  >> makela.md
# echo "ERROR," $FAILED "failed disks" >> makela.md
else
  echo "|" $(date +'%Y-%m-%d') "|" $(date +"%H:%M") "|" "OK", $WORKING "working disks |"  >> makela.md
fi
