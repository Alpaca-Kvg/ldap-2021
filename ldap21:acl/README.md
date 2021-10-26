# LDAP @Alpaca-Kvg ASIX
# Curs 2021-2022

**alpacakvg/ldap21:acl** Servidor LDAP amb la base de dades edt.org

```
docker network create 2hisx
docker build -t alpacakvg/ldap21:acl
docker run --rm --name ldap.edt.org -h ldap.edt.org --net 2hisx -p 389:389 -it alpacakvg/ldap21:acl /bin/bash 

slapcat -n0
ldapsearch -x -h localhost -LLL -D 'cn=Sysadmin,cn=config' -w syskey -b 'cn=config'
ldapsearch -x -h localhost -LLL -D 'cn=Sysadmin,cn=config' -w syskey -b 'oldcDatabase={1}bdb,cn=config'


```

* **Exercicis fets:**
* eliminats els schemas innecessàris
* definir la base de dades cn=config amb usuari
  cn=Sysadmin,cn=config i passwd syskey 
* 1) accesss to * by * read. Fitxer acl1.ldif
  - annonymous
  - read propi / altres
  - write propi
  - write altres
```
ldapmodify -xvc -D 'cn=Sysadmin,cn=config' -w syskey -f acl1.ldif
ldap_initialize( <DEFAULT> )
delete olcAccess:
add olcAccess:
	to  * by * read
modifying entry "olcDatabase={1}mdb,cn=config"
modify complete

ldapsearch -x -h localhost -LLL -D 'cn=Sysadmin,cn=config' -w syskey -b 'olcDatabase={1}mdb,cn=config' olcAccess
ldapsearch -x -h localhost -LLL -D 'cn=Sysadmin,cn=config' -w syskey -b 'olcDatabase={1}mdb,cn=config' olcAccess
dn: olcDatabase={1}mdb,cn=config
olcAccess: {0}to  * by * read

ldapsearch -x -LLL
OK
ldapsearch -x -LLL -D 'uid=Anna,ou=usuaris,dc=edt,dc=org' -w anna
OK 
ldappasswd -v -D 'uid=Anna,ou=usuaris,dc=edt,dc=org' -w anna -s kaka
NO
ldapmodify -v -D 'uid=Anna,ou=usuaris,dc=edt,dc=org' -w anna -f modify1.ldif
NO
```
* 2) acces to * by * write. Fitxer acl2.ldif
  - modificar propi 
  - modificar altre
```
ldapmodify -xvc -D 'cn=Sysadmin,cn=config' -w syskey -f acl2.ldif
ldap_initialize( <DEFAULT> )
delete olcAccess:
add olcAccess:
	to  * by * write
modifying entry "olcDatabase={1}mdb,cn=config"
modify complete
ldapsearch -x -h localhost -LLL -D 'cn=Sysadmin,cn=config' -w syskey -b 'olcDatabase={1}mdb,cn=config' olcAccess
dn: olcDatabase={1}mdb,cn=config
olcAccess: {0}to  * by * write

ldappasswd -v -D 'uid=Anna,ou=usuaris,dc=edt,dc=org' -w anna -s kaka
OK
ldapmodify -v -D 'uid=Anna,ou=usuaris,dc=edt,dc=org' -w anna -f modify1.ldif
OK
```
* 3) acces to by selft write by * read
  - modificar propi
  - modificar altre
  - read altre
```
ldapmodify -xvc -D 'cn=Sysadmin,cn=config' -w syskey -f acl3.ldif
ldap_initialize( <DEFAULT> )
delete olcAccess:
add olcAccess:
	to by self write  by * read
modifying entry "olcDatabase={1}mdb,cn=config"
modify complete
ldapsearch -x -h localhost -LLL -D 'cn=Sysadmin,cn=config' -w syskey -b 'olcDatabase={1}mdb,cn=config' olcAccess
dn: olcDatabase={1}mdb,cn=config
olcAccess: {0}to by self write  by * read
ldappasswd -v -D 'uid=Anna,ou=usuaris,dc=edt,dc=org' -w anna -s kaka
OK
ldapmodify -v -D 'uid=Anna,ou=usuaris,dc=edt,dc=org' -w anna -f modify2.ldif
NO
ldapsearch -x -LLL
OK

```
* 4) acces to attrs=userPassword
		by selft write
		by * auth
   acces to * by * read
  - modificar passwd propi
  - no podem canviar els altres nostres
  - no podem canviar els altres passwd
  - tampoc podem canviar res dels altres 
  - podem mirar-ho tot
```
ldapmodify -xvc -D 'cn=Sysadmin,cn=config' -w syskey -f acl4.ldif
ldap_initialize( <DEFAULT> )
add olcAccess:
	to attrs=UserPassword by self write by * auth
	to * by * read
modifying entry "olcDatabase={1}mdb,cn=config"
modify complete
ldapsearch -x -h localhost -LLL -D 'cn=Sysadmin,cn=config' -w syskey -b 'olcDatabase={1}mdb,cn=config' olcAccess
dn: olcDatabase={1}mdb,cn=config
olcAccess: {0}to by self write  by * read
olcAccess: {1}to attrs=UserPassword by self write by * auth
olcAccess: {2}to * by * read
ldappasswd -v -D 'uid=Anna,ou=usuaris,dc=edt,dc=org' -w anna -s kaka
OK
ldapmodify -v -D 'uid=Anna,ou=usuaris,dc=edt,dc=org' -w anna -f modifiy4.ldif
NO
ldapmodify -v -D 'uid=Anna,ou=usuaris,dc=edt,dc=org' -w anna -f PerepasswdDif.ldif
NO
ldapmodify -v -D 'uid=Anna,ou=usuaris,dc=edt,dc=org' -w anna -f modifiy3.ldif
NO
ldapsearch -x -LLL
```

