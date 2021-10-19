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
+ Ficheros para los usuarios macacos

* **alpacakvg/ldap21:practica** Servidor LDAP editat amb la base de dades edt.org 
  
  S'ha fet el següent:

	* prova.schema con objectclass derivado de inetOrgPerson, structural y objectclass SUP TOP auxiliary.
	* injectar dades de data-macacos.ldif


```

docker run --rm --name ldap.edt.org -h ldap.edt.org -p389:389 --net hisx2 -it alpacakvg/ldap21:schema /bin/bash

docker run --rm --name phpldapadmin.edt.org -h phpldapadmin.edt.org --network 2hisx -p 80:80 -d edtasixm06/phpldapadmin:20

``` 


