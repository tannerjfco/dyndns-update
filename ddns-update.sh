#!/bin/sh

UPDATEURL="http://freedns.afraid.org/dynamic/update.php?$APIKEY"

registered=$(dig $DOMAIN +short)

  current=$(wget -q -O - http://checkip.dyndns.org|sed s/[^0-9.]//g)
       [ "$current" != "$registered" ] && {                           
          wget -q -O /dev/null $UPDATEURL 
          echo "DNS updated on:"; date
  }
