**Lab-8 : Shell**

- Créez un dossier `lab-8`
- Déplacez-vous dans ce dossier
- Créez un Vagrantfile afin de configurer 3 VMs à partir des informations suivantes :
  - Image de base : `ubuntu/xenial64`
  - CPU : 1
  - RAM : 1 Go
  - VM1 : lb, ip : 10.0.0.10, exécutez [le script suivant](#)
  - VM2 : web1, ip : 10.0.0.11, exécutez [le script suivant](#)
  - VM3 : web2, ip : 10.0.0.12, exécutez [le script suivant](#)
- N’hésitez pas à lire le script pour mieux comprendre les opérations exécutées
- Accédez à l’interface web de chaque serveur et confirmez que l’application a bien été installée
- Arrêtez les VMs puis supprimez les
