# vpnuja-connect
Script para conectarse a la VPN SSL de la Universidad de Jaén desde Linux


## Introducción

La Universidad de Jaén proporciona acceso para sus usuarios a una VPN basada en
SSL (https://www10.ujaen.es/conocenos/servicios-unidades/sinformatica/vpnssl),
de _fácil uso_ ya que apenas necesita configuración, y la conexión se establece
desde el navegador.

El problema es que todo se hace a través de un _plugin_ que, al menos en Linux,
no funciona en ningún navegador moderno, aunque se habilite explícitamente el
soporte para este tipo de _plugins_ antiguos. En mi caso, tras seguir todos los
pasos del tutorial: ejecutar Firefox como _root_, habilitar los plugins, etc.,
cuando ya parecía que me iba a poder conectar, me salió un mensaje en el
navegador (Firefox 58) que indicaba abiertamente que ese tipo de plugins no
estaba soportado. Con Google Chrome y Qupzilla tampoco hubo mucha más suerte.

Después de descargar el fichero para instalar manualmente el _plugin_, y
ejecutar el instalador como _root_, comprobé que éste incorpora un cliente de
línea de comandos (CLI)...


## Instalación

En primer lugar hemos de descargar el siguiente archivo:

https://vpnssl.ujaen.es/public/download/linux_sslvpn.tgz

Luego lo descomprimimos en cualquier carpeta con la orden:

    tar xvf linux_sslvpn.tgz

Nótese que, aunque la extensión es `tgz`, el archivo no está realmente
comprimido, es un `tar` normal.

Ejecutamos como _root_ la orden de instalación:

    sudo ./Install.sh

Respondemos afirmativamente a las preguntas, con lo que se instalará la versión
de línea de comandos (CLI) del cliente.

En cuanto al _script_ propiamente dicho, basta con hacerlo ejecutable:

    chmod +x vpnujaconn.sh

editarlo para poner nuestro nombre de usuario TIC, y finalmente invocarlo con:

    ./vpnujaconn.sh

## El Script

El _script_, escrito en _bash_, es extremadamente simple. Primero llama a
`ssh-askpass` para obtener la contraseña, luego invoca al ejecutable `f5fpc`
para iniciar la conexión, espera que se pulse una tecla, y la cierra.

La llamada para la conexión se hace con la opción `-x`, que deshabilita la
comprobación del certificado del servidor. He intentado que se verifique el
certificado de la Universidad, pero no lo he logrado aún. Se aceptan
sugerencias.

## Uso

Basta con ejecutar el _script_ como _root_ (parece que como usuario normal también
funciona, pero no estoy del todo seguro) y dejar la consola abierta.

Para salir y cerrar la conexión, pulsamos cualquier tecla.


## Configuración

Solo hace falta poner en el _script_ tu nombre de usuario de la Universidad.    
