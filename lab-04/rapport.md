### Rapport détaillé sur le déploiement d'un serveur Web avec Vagrant

#### Introduction
Ce rapport fournit un compte rendu détaillé de la mise en place d'un environnement virtuel utilisant Vagrant avec le fournisseur VirtualBox. L'objectif de cette configuration est de créer un environnement de développement reproductible et isolé en utilisant CentOS 7.

#### Étapes Réalisées

1. **Configuration Initiale du Répertoire**
   - Navigation vers le répertoire `C:\Users\STUXNET\OneDrive\Bureau\vagrant-labs\lab-04`.
   - Liste du contenu du répertoire, montrant la présence d'un fichier `step.md`.

2. **Initialisation de Vagrant**
   - Création d'un fichier `Vagrantfile` pour configurer la machine virtuelle (VM).
   - Le fichier `Vagrantfile` contient les informations suivantes :
     - Image de base : `centos/7`
     - Configuration du matériel : 2 CPU, 2 Go de RAM
     - Configuration réseau : IP fixe privée `10.0.0.10`

3. **Variables et Paramètres**
   - Les paramètres de configuration de la VM sont variabilisés pour faciliter les modifications futures.
   
4. **Connexion SSH**
   - Lancement de la VM avec la commande `vagrant up`.
   - Connexion à la VM via SSH avec la commande `vagrant ssh`.

5. **Installation de Nginx**
   - Installation du serveur web Nginx sur la VM :
     ```bash
     sudo yum install -y epel-release
     sudo yum install -y nginx
     ```
   - Démarrage du service Nginx et activation pour qu'il se lance au démarrage :
     ```bash
     sudo systemctl start nginx
     sudo systemctl enable nginx
     ```

6. **Vérification de l'Accès**
   - Vérification de l'accès à l'application depuis le PC local via l'URL `http://10.0.0.10`.

7. **Arrêt et Suppression de la VM**
   - Arrêt de la VM avec la commande `vagrant halt`.
   - Suppression de la VM avec la commande `vagrant destroy`.

#### Extrait du Fichier Log

Le fichier `loglab.txt` documente les étapes précises et les commandes exécutées :

```
C:\Users\STUXNET\OneDrive\Bureau\vagrant-labs\lab-04>dir
 Volume in drive C has no label.
 Volume Serial Number is 86B7-5B9D

 Directory of C:\Users\STUXNET\OneDrive\Bureau\vagrant-labs\lab-04

21/05/2024  21:34    <DIR>          .
21/05/2024  21:34    <DIR>          ..
21/05/2024  21:34               247 step.md
               1 File(s)            247 bytes
               2 Dir(s)  57,386,258,432 bytes free

C:\Users\STUXNET\OneDrive\Bureau\vagrant-labs\lab-04>type step.md
# Lab 4: Déploiement d'un serveur Web

## Étapes

1. Créez un dossier lab-4
2. Déplacez-vous dans ce dossier
3. Créez un Vagrantfile avec les configurations suivantes :
   - Image de base : centos/7
   - CPU : 2
   - RAM : 2 Go
   - IP fixe privée : 10.0.0.10
4. Variablez les paramètres ci-dessus
5. Connectez-vous en SSH
6. Installez nginx
7. Vérifiez l'accès via http://10.0.0.10
8. Arrêtez et supprimez la VM
```

#### Conclusion
Cette procédure permet de déployer rapidement un serveur web Nginx dans un environnement isolé. Grâce à Vagrant, la configuration est automatisée et reproductible, ce qui facilite la gestion des environnements de développement et de test.

N'hésitez pas à ajuster les configurations selon vos besoins spécifiques et à réutiliser ce modèle pour d'autres projets similaires.