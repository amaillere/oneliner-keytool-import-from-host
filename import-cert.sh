#!/bin/bash
if [[ $# != 4 ]] ; then
    echo 'usage : $0 hostname portNumber truststore password'
    exit 1
fi
HOST=$1
PORT=$2
TS=$3
PW=$4

keytool -printcert -sslserver $HOST:$PORT -rfc | keytool -import -noprompt -alias $HOST -keystore $TS -storepass $PWD

keytool -list -v -keystore $TS -storepass $PWD -alias $HOST
