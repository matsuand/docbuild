#!/bin/sh

arg=$1

LOGFILE=$PWD/hugo.log

case ${arg} in

  "" | "start")
    pid=$(pidof hugo)
    if test "x${pid}" != "x"; then
      echo Started already.
    else
      echo -n Starting hugo server...
      cd src && \
        hugo server -b http://${HOSTNAME}:1313 --bind 0.0.0.0 >>$LOGFILE 2>&1 & 
      echo done
    fi
    ;;

  "stop")
    pid=$(pidof hugo)
    if test "x${pid}" = "x"; then
      echo Nothing to stop.
    else
      echo -n Stopping hugo server...
      kill -9 "${pid}" >>$LOGFILE 2>&1
      echo done.
    fi
    ;;

  "status")
    pid=$(pidof hugo)
    if test "x${pid}" = "x"; then
      echo Nothing executed.
    else
      ps -ef | grep "hugo" | grep -v "grep"
    fi
    ;;

  * )
    echo Unknown argument: ${arg}
    ;;

esac
