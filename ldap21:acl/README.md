# LDAP Server
## @edt ASIX M06-ASO 2021-2022
### Servidor LDAP (Debian 11)

Podeu trobar les imatges docker al Dockehub de [alpacakvg](https://hub.docker.com/u/alpacakvg/)

ASIX M06-ASO Escola del treball de barcelona

### Contenido

+ Fichero ldif con toda la base edt junta + añadidos
+ Dockerfile
+ install.sh
+ Fichero para configurar /etc/ldap/ldap.conf

* **alpacakvg/ldap21:acl** Servidor LDAP editat amb la base de dades edt.org 
  
  S'ha fet el següent:
	
	* Eliminar schemas no necesaris
	* Definir base de dates cn=config amb user cn=Sysadmin,cn=config i passwd syskey

```
docker network create hisx2

docker build -t alpacakvg/ldap21:acl .

docker run --rm --name ldap.edt.org -h ldap.edt.org -p389:389 --net hisx2 -it alpacakvg/ldap21:acl /bin/bash

slapcat -n0

ldapsearch -x -LLL -D 'cn=Sysadmin,cn=config' -w syskey -b 'cn=config' dn

ldapsearch -x -LLL -D 'cn=Sysadmin,cn=config' -w syskey -b 'cn=config' olcDatabase={-1}frontend

ldapsearch -x -LLL -D 'cn=Sysadmin,cn=config' -w syskey -b 'olcDatabase={1}mdb,cn=config' olcAccess

``` 


