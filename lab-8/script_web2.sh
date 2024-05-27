#!/bin/bash
echo "Script pour web2"
echo "================================"
echo 'Starting Provision: web'$2
sudo apt-get update
sudo apt-get install -y nginx
echo "<h1>Machine: web"$2 "</h1>" > /var/www/html/index.html
echo 'Provision web'$2 'complete'
echo "Eurin c'est bon aussi "
echo "Eurin HASH -  LA FIN DU LAB"
echo " " 
# Ajoutez les commandes nécessaires pour configurer web1

echo "Bravo Tu l'as fait "

# Ajoutez les commandes nécessaires pour configurer web2
