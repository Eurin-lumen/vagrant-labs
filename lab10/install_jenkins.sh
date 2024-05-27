#!/bin/bash

set -e  # Arrêter le script en cas d'erreur

# Fonction de vérification
check_success() {
  if [ $? -ne 0 ]; then
    echo "Erreur lors de l'exécution de la commande précédente. Arrêt du script."
    exit 1
  fi
}

# Mise à jour des paquets
sudo yum update -y
check_success

# Installation des dépendances nécessaires
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
check_success

# Ajout du dépôt Docker
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
check_success

# Installation de Docker
sudo yum install -y docker-ce docker-ce-cli containerd.io
check_success

# Démarrage de Docker
sudo systemctl start docker
check_success
sudo systemctl enable docker
check_success

# Téléchargement de Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo snap install docker-compose

check_success

# Ajout des permissions d'exécution à Docker Compose
sudo chmod +x /usr/local/bin/docker-compose
check_success

# Vérification de l'installation
docker-compose --version
check_success

echo 'Pour cette installation, vous utiliserez l'adresse IP 192.168.50.4'
echo 'Identifiant : utilisateur et mot de passe : bitnami'

# Script de vérification pour s'assurer que Docker et Docker Compose sont bien installés et fonctionnent correctement
echo "Vérification de Docker..."
sudo systemctl status docker > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "Docker est en cours d'exécution."
else
  echo "Docker n'est pas en cours d'exécution. Veuillez vérifier l'installation."
  exit 1
fi

echo "Vérification de Docker Compose..."
docker-compose --version > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "Docker Compose est installé."
else
  echo "Docker Compose n'est pas installé correctement. Veuillez vérifier l'installation."
  exit 1
fi

echo "Toutes les vérifications sont passées avec succès."
