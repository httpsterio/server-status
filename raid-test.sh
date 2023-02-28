#!/bin/bash

WORKING=$(mdadm -D /dev/md0 | grep "Working" | grep -Eo '[0-9]')
FAILED=$(mdadm -D /dev/md0 | grep "Failed" | grep -Eo '[0-9]')

echo $(date +"%F %T")

if (($WORKING != 2)); 
then
  echo "ERROR," $FAILED "failed disks"
  echo ""
else
  echo "OK," $WORKING "working disks"
  echo ""
fi
