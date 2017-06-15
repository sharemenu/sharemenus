#!/bin/sh

source /etc/profile

BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`
MAIN_CLASS=com.sharemenu.company.CompanyServiceLauncher

# If a specific java binary isn't specified search for the standard 'java' binary
if [ -z "$JAVACMD" ] ; then
  if [ -n "$JAVA_HOME"  ] ; then
      JAVACMD="$JAVA_HOME/bin/java"
  else
    JAVACMD=`which java`
  fi
fi


CLASSPATH="$BASEDIR"/conf:"$BASEDIR"/lib/*
LOGDIR="$BASEDIR/log"

echo "$CLASSPATH"

if [ ! -x "$JAVACMD" ] ; then
  echo "Error: JAVA_HOME is not defined correctly."
  echo "  We cannot execute $JAVACMD"
  exit 1
fi

if [ -z "$OPTS_MEMORY" ] ; then
    OPTS_MEMORY="-server -Xms4G -Xmx4G -Xss512k -XX:MetaspaceSize=1G -XX:MaxMetaspaceSize=1G"
fi

nohup "$JAVACMD" $JAVA_OPTS \
  $OPTS_MEMORY \
  -classpath "$CLASSPATH" \
  -Dbasedir="$BASEDIR" \
  -Ddubbo.registry.file="$BASEDIR/sharemenus-cache.properties" \
  -Dfile.encoding="UTF-8" \
  -Djava.awt.headless="true" \
  -Dsun.net.client.defaultConnectTimeout="60000" \
  -Dsun.net.client.defaultReadTimeout="60000" \
  -Djmagick.systemclassloader="no" \
  -Dnetworkaddress.cache.ttl="300" \
  -Dsun.net.inetaddr.ttl=300 \
  -XX:+HeapDumpOnOutOfMemoryError \
  -XX:HeapDumpPath="$LOGDIR/" \
  -XX:ErrorFile="$LOGDIR/java_error_%p.log" \
  -Ddubbo.monitor.collect=true \
  -Ddubbo.monitor.file.path="/data/logs/sharemenus/" \
  $MAIN_CLASS \
  "$@" &
