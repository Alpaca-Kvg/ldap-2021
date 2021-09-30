#!/bin/bash

rm -rf /etc/ldap/slapd.d/*
rm -rf /var/lib/ldap/*
slaptest -f slapd.conf -F /etc/ldap/slapd.d
slapadd -F /etc/ldap/slapd.d/ -l organitzacio.ldif
chown -R openldap.openldap /etc/ldap/slapd.d/ /var/lib/ldap/
/usr/sbin/slapd
#injeccion usuaris
#ldapadd -x -h 172.17.0.2 -D "cn=Manager,dc=edt,dc=org" -w secret -f users.ldif 
