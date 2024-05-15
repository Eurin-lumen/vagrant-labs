### Lab-3 : Création d'un Vagrantfile

Pour réussir ce lab, nous allons suivre les instructions détaillées en utilisant les commandes et les configurations appropriées. Voici les étapes de réalisation en détail :

#### Étapes de Réalisation

1. **Création du Dossier de Travail**
   - **Commande utilisée** : `mkdir lab-3`
   - **Détail** : Création du répertoire de travail `lab-3`.

   ```plaintext
   PS C:\Users\STUXNET\OneDrive\Bureau\vagrant-labs> mkdir lab-3
   PS C:\Users\STUXNET\OneDrive\Bureau\vagrant-labs> cd lab-3
   ```

2. **Initialisation d'un Dépôt Git**
   - **Commande utilisée** : `git init`
   - **Détail** : Initialisation d'un dépôt Git dans le répertoire de travail.

   ```plaintext
   PS C:\Users\STUXNET\OneDrive\Bureau\vagrant-labs\lab-3> git init
   ```

3. **Création du Vagrantfile**
   - **Commande utilisée** : `vagrant init geerlingguy/centos7`
   - **Détail** : Création du fichier `Vagrantfile` avec la configuration de base pour CentOS 7.

   ```plaintext
   PS C:\Users\STUXNET\OneDrive\Bureau\vagrant-labs\lab-3> vagrant init geerlingguy/centos7
   ```

4. **Modification du Vagrantfile**
   - **Détail** : Modifier le fichier `Vagrantfile` pour configurer la VM avec les paramètres suivants :
     - CPU : 2
     - RAM : 2 Go
     - Utilisation de variables pour les paramètres de configuration.

   ```ruby
   Vagrant.configure("2") do |config|
     config.vm.box = "geerlingguy/centos7"

     # Variables pour les paramètres
     cpu_count = 2
     ram_size = 2048

     # Configuration de la VM
     config.vm.provider "virtualbox" do |vb|
       vb.memory = ram_size
       vb.cpus = cpu_count
     end
   end
   ```

5. **Validation du Vagrantfile**
   - **Commande utilisée** : `vagrant validate`
   - **Détail** : Validation du fichier `Vagrantfile` pour s'assurer qu'il est correctement configuré.

   ```plaintext
   PS C:\Users\STUXNET\OneDrive\Bureau\vagrant-labs\lab-3> vagrant validate
   Vagrantfile validated successfully.
   ```

6. **Démarrage de la Machine Virtuelle**
   - **Commande utilisée** : `vagrant up`
   - **Détail** : Téléchargement et démarrage de la VM.

   ```plaintext
   PS C:\Users\STUXNET\OneDrive\Bureau\vagrant-labs\lab-3> vagrant up
   ```

7. **Vérification de l'État de la Machine Virtuelle**
   - **Commande utilisée** : `vagrant status`
   - **Détail** : Vérification que la machine est en cours d'exécution.

   ```plaintext
   PS C:\Users\STUXNET\OneDrive\Bureau\vagrant-labs\lab-3> vagrant status
   Current machine states:
   default                   running (virtualbox)
   ```

8. **Connexion à la Machine Virtuelle**
   - **Commande utilisée** : `vagrant ssh`
   - **Détail** : Connexion SSH à la VM pour effectuer des configurations supplémentaires.

   ```plaintext
   PS C:\Users\STUXNET\OneDrive\Bureau\vagrant-labs\lab-3> vagrant ssh
   ```

9. **Mise à Jour des Dépôts et Installation de Nginx**
   - **Commandes utilisées** :
     - `sudo yum update -y`
     - `sudo yum install nginx -y`
   - **Détail** : Mise à jour des dépôts et installation du serveur web Nginx.

   ```plaintext
   [vagrant@localhost ~]$ sudo yum update -y
   [vagrant@localhost ~]$ sudo yum install nginx -y
   ```

10. **Démarrage et Activation de Nginx**
    - **Commandes utilisées** :
      - `sudo systemctl start nginx`
      - `sudo systemctl enable nginx`
    - **Détail** : Démarrage du service Nginx et activation pour démarrage automatique.

    ```plaintext
    [vagrant@localhost ~]$ sudo systemctl start nginx
    [vagrant@localhost ~]$ sudo systemctl enable nginx
    ```

11. **Vérification du Fonctionnement de Nginx**
    - **Commande utilisée** : `sudo systemctl status nginx`
    - **Détail** : Vérification que Nginx est bien installé et en fonctionnement.

    ```plaintext
    [vagrant@localhost ~]$ sudo systemctl status nginx
    ```

12. **Arrêt et Destruction de la Machine Virtuelle**
    - **Commandes utilisées** :
      - `vagrant halt`
      - `vagrant destroy -f`
    - **Détail** : Arrêt et suppression de la VM.

    ```plaintext
    [vagrant@localhost ~]$ exit
    PS C:\Users\STUXNET\OneDrive\Bureau\vagrant-labs\lab-3> vagrant destroy -f
    ```

### Conclusion

En suivant ces étapes, vous serez en mesure de créer, configurer et gérer une machine virtuelle CentOS 7 en utilisant Vagrant et VirtualBox. Vous aurez également installé et configuré Nginx sur cette VM, puis détruit la VM une fois le travail terminé.