#!/bin/bash

# Version to download and build.
NETSNMP_VERSION="5.8"

# PULL SOURCE
curl -L https://sourceforge.net/projects/net-snmp/files/net-snmp/${NETSNMP_VERSION}/net-snmp-${NETSNMP_VERSION}.tar.gz/download > net-snmp-${NETSNMP_VERSION}.tar.gz
if [ $? -ne 0 ]; then
    echo "error: could not download target version of net-snmp."
    exit 99
fi

# ./configure --with-default --with-ldflags=-Bstatic
# make
# cd apps
# find . -maxdepth 1 -perm 0755 | xargs cp /to/bin/dir
# zip bindir to /tmp/repo

