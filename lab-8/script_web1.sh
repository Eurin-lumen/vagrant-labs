#!/bin/bash

echo 'Starting Provision: web'$1
sudo apt-get update
sudo apt-get install -y nginx
echo "<h1>Machine: web"$1 "</h1>" > /var/www/html/index.html
echo 'Provision web'$1 'complete'
echo "Eurin c'est bon aussi "
echo "Eurin HASH - C'est parti est Terminé on passe au suivant "
echo " =====> " 
# Ajoutez les commandes nécessaires pour configurer web1
