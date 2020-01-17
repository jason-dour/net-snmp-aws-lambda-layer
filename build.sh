#!/bin/bash

# Version to download and build.
NETSNMP_VERSION="5.8"

# Change to the repo working directory.
cd /tmp/repo

# PULL SOURCE
curl -L https://sourceforge.net/projects/net-snmp/files/net-snmp/${NETSNMP_VERSION}/net-snmp-${NETSNMP_VERSION}.tar.gz/download > net-snmp-${NETSNMP_VERSION}.tar.gz
if [ $? -ne 0 ]; then
    echo "error: could not download target version of net-snmp."
    exit 1
fi

# Untar the source.
tar -zxf net-snmp-${NETSNMP_VERSION}.tar.gz
if [ $? -ne 0 ]; then
    echo "error: could not untar source files."
    exit 2
fi

# Change working directory.
cd net-snmp-${NETSNMP_VERSION}
mkdir bin

# Build the tools.
./configure --with-defaults --with-ldflags=-Bstatic && \
    make
if [ $? -ne 0 ]; then
    echo "error: could not compile net-snmp."
    exit 3
fi

find apps -maxdepth 1 -perm 0755 -exec cp {} bin/ \; && \
    zip -r9 ../net-snmp-${NETSNMP_VERSION}.zip bin/
if [ $? -ne 0 ]; then
    echo "error: could not package net-snmp."
    exit 4
fi

cd /tmp/repo
rm -rf net-snmp-${NETSNMP_VERSION} net-snmp-${NETSNMP_VERSION}.tar.gz

exit 0