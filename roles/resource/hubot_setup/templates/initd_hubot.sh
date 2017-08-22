#!/bin/bash
# hubot
# chkconfig: 345 20 80
# description: hubot
# processname: hubot

# {{ phaban_managed }}

# This script assumes you have a user called "hubot" on your system and that hubot is installed in /opt/hubot

DAEMON="/opt/hubot/finbot-node/hubot.sh"
DAEMONOPTS="--name {{ ec2_tags.tags.bot_name }} --adapter {{ ec2_tags.tags.adapter | default('slack') }}"

NAME=hubot
USER=hubot
DESC="hubot"
PIDFILE=/var/run/$NAME.pid
SCRIPTNAME=/etc/init.d/$NAME

case "$1" in
    start)
        printf "%-50s" "Starting $DESC..."
    PID=`runuser -c "cd /opt/hubot/finbot-node && $DAEMON $DAEMONOPTS" - $USER  >> /var/log/hubot.log 2>&1 & echo $!`
        echo $PID > /var/run/$NAME.pid
        if [ -z $PID ]; then
            printf "%s\n" "Fail"
        else
            echo $PID > $PIDFILE
            printf "%s\n" "Ok"
        fi
    ;;
    status)
        printf "%-50s" "Checking $DESC..."
        if [ -f $PIDFILE ]; then
            PID=`cat $PIDFILE`
            if [ -z "`ps axf | grep ${PID} | grep -v grep`" ]; then
                printf "%s\n" "Process dead but pidfile exists"
            else
                echo "Running ($PID) . . ."
            fi
        else
            printf "%s\n" "Service not running"
        fi
    ;;
    stop)
        printf "%s\n" "Stopping $DESC"
        for pid in $( ps aux | grep "/opt/hubot" | grep -v grep | awk '{print $2}' ); do
            kill -9 $pid
        done
        rm -fr $PIDFILE
    ;;
    restart)
        $0 stop
        $0 start
    ;;
    *)
        echo "Usage: $0 {status|start|stop|restart}"
        exit 1
esac
