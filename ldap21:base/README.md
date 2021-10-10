# LDAP Server
## @alpaca ASIX M06-ASO 2021-2022
### Servidor LDAP (Debian 11)

Podeu trobar les imatges docker al Dockehub de [alpacakvg](https://hub.docker.com/u/alpacakvg/)

ASIX M06-ASO Escola del treball de barcelona

### Contenido

+ ficheros configuracion servidor ldap
+ ficheros ldif base de datos edt
+ Dockerfile creacion imagen
+ Script instalación
+ Ficheros varios de modificación
 * **alpacakvg/ldap21:base** Servidor LDAP base inicial amb la base de dades edt.org

```
docker network create hisx2
docker build -t alpacakvg/ldap21:base .

docker run --rm --name ldap.edt.org -h ldap.edt.org --net hisx2 -d alpacakvg/ldap21:base

docker ps

ldapsearch -x -LLL -h ldap.edt.org -b 'dc=edt,dc=org'
``` 


