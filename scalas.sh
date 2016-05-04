#!/usr/bin/env bash

PARENT_COMMAND="$(ps -o comm=$PPID)"
echo $PARENT_COMMAND

TMP_SCRIPT=/tmp/scala_script_`md5sum $1`
cp $1 $TMP_SCRIPT

SBT_JAR=`dirname $0`/sbt-launch.jar 
SBT_OPTS="-Dsbt.main.class=sbt.ScriptMain -Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
java $SBT_OPTS -jar $SBT_JAR $TMP_SCRIPT "$@"
