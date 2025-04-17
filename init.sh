#!/bin/bash

# Paso 1: Reconstruir la imagen Docker
docker build -t react-app .  # Reconstruye la imagen con el tag 'react-app'

# Paso 2: Detener y eliminar el contenedor antiguo (si está en ejecución)
docker stop react-frontend  # Detner contenedor
docker rm -f react-frontend  # Elimina el contenedor detenido

# Paso 3: Ejecutar el contenedor con la nueva imagen y los volúmenes adecuados
docker run -d --name react-frontend -p 3002:80 -v ./src:/app/src -v ./public:/app/public react-app  # Ejecuta el contenedor con la nueva imagen

# Paso 4: Eliminar imágenes no utilizadas (imágenes residuales)
docker image prune -f

echo "¡Actualización completada con éxito!"
