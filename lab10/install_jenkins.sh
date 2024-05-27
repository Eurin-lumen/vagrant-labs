#!/bin/bash

# Mise à jour des paquets
sudo yum update -y

# Installation des dépendances nécessaires
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Ajout du dépôt Docker
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Installation de Docker
sudo yum install -y docker-ce docker-ce-cli containerd.io

# Démarrage de Docker
sudo systemctl start docker
sudo systemctl enable docker

# Téléchargement de Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Ajout des permissions d'exécution à Docker Compose
sudo chmod +x /usr/local/bin/docker-compose

# Vérification de l'installation
docker-compose --version

echo 'For this Stack, you will use 192.168.50.4 IP Address'
echo 'login : user and password : bitnami'
