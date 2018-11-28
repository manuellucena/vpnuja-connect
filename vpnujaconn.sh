#!/bin/bash

#
#  vpnujaconn.sh
#
#


# Poner aquí el nombre de usuario de la UJA

user=indica_tu_USUARIO_en_el_script

# Obtener la contraseña
pass=''
while [ -z ${pass} ]; do
    pass=`ssh-askpass "Introduzca la contraseña de su cuenta TIC para el usuario $user"`
done

# Iniciar la conexión
f5fpc -s -t https://vpnssl.ujaen.es -x -u ${user} -p ${pass}
answer=`f5fpc --info`

if [[ $answer == *"session established"*  ||  $answer == *"logged in"* ]]; then
  zenity --info --text "Conexión creada con éxito.\n\nPulse OK para cerrar la conexión."
  # Para usar la intefaz solo texto, descomentar las siguientes dos líneas:

  # echo "Pulse cualquier tecla para cerrar la conexión"
  # read -n 1 -s


  # Desconectar
  echo "Desconectando..."
  f5fpc -o
else
  zenity --info --text "Error en la conexión: $answer"
fi


