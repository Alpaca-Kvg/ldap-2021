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
+ 

* **alpacakvg/ldap21:editat** Servidor LDAP editat amb la base de dades edt.org

```
docker network create hisx2
docker build -t alpacakvg/ldap21:editat .

docker run --rm --name ldap.edt.org -h ldap.edt.org --net hisx2 -d alpacakvg/ldap21:editat

docker ps

ldapsearch -x -LLL 
``` 


