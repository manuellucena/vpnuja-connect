#!/bin/bash

#
#  vpnujaconn.sh
#
#


# Poner aquí el nombre de usuario de la UJA

user=usuarioTIC

# Obtener la contraseña
pass=''
while [ -z "${pass}" ]; do
    pass=`ssh-askpass "Introduzca la contraseña de su cuenta TIC"`
done

# Iniciar la conexión
f5fpc -s -t https://vpnssl.ujaen.es -x -u ${user} -p "${pass}"


# Para usar la intefaz solo texto, descomentar las siguientes dos líneas:

# echo "Pulse cualquier tecla para cerrar la conexión"
# read -n 1 -s


# Interfaz con zenity, comentar si se usa la interfaz solo texto:

zenity --info --text "Pulse Ok para cerrar la conexión"


# Desconectar
echo "Desconectando..."
f5fpc -o
