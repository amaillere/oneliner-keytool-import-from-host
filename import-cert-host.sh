#!/bin/bash
if [[ $# != 2 ]] ; then
    echo 'usage : $0 hostname portNumber'
    exit 1
fi

cat warning.txt

HOST=$1
PORT=$2
PWD="changeit"

declare -a trustStores=("C:\Program Files\AdoptOpenJDK\jdk-11.0.9.101-hotspot\lib\security\cacerts" 
                "C:\Program Files\Java\java-1.8.0-openjdk-1.8.0.275-1.b01.dev.redhat.windows.x86_64\jre\lib\security\cacerts"
                "C:\Users\maillerea\AppData\Roaming\JetBrains\IntelliJIdea2020.3\ssl\cacerts"
                )
for KS in "${trustStores[@]}"
do
	keytool -printcert -sslserver $HOST:$PORT -rfc | keytool -import -noprompt -alias $HOST -keystore "$KS" -storepass $PWD
	keytool -list -v -keystore "$KS" -storepass $PWD -alias $HOST
done
