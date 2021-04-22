#!/bin/bash
if [[ $# != 2 ]] ; then
    echo 'usage : $0 file alias'
    exit 1
fi

cat warning.txt

FILE=$1
ALIAS=$2
PWD="changeit"

declare -a trustStores=("C:\Program Files\AdoptOpenJDK\jdk-11.0.9.101-hotspot\lib\security\cacerts" 
                "C:\Program Files\Java\java-1.8.0-openjdk-1.8.0.275-1.b01.dev.redhat.windows.x86_64\jre\lib\security\cacerts"
                "C:\Users\maillerea\AppData\Roaming\JetBrains\IntelliJIdea2020.3\ssl\cacerts"
                "C:\prog\Projects\lactalis\application-lactaflux-mongo\src\main\docker\cacerts"
                )

for KS in "${trustStores[@]}"
do
	keytool -import -noprompt -alias "$ALIAS" -file "$FILE" -keystore "$KS" -storepass $PWD
	keytool -list -v -keystore "$KS" -storepass $PWD -alias "$ALIAS"
done
