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

* **alpacakvg/ldap21:editat** Servidor LDAP editat amb la base de dades edt.org 
  
  S'ha fet el següent:

	* generar un sol fitxer ldif anomenat edt.org.ldif

	* afegir en el fitxer dos usuaris i una ou nova inventada.

 	* modificar el fitxer edt.org.ldif  modificant dn dels usuaris utilitzant en lloc del cn el uid per identificar-los. 

	* configurar el password de Manager que sigui ‘secret’ però encriptat (posar-hi un comentari per indicar quin és de cara a estudiar).

	* afegr el fitxer de configuració client.

	* propagar el port amb -P  -p

```
docker network create hisx2

docker build -t alpacakvg/ldap21:editat .

docker run --rm --name ldap.edt.org -h ldap.edt.org -p389:389 --net hisx2 -d alpacakvg/ldap21:editat

docker ps

ldapsearch -x -LLL 
``` 


