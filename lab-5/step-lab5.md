Pour réaliser ce lab de déploiement d'un serveur Web avec Vagrant, voici les étapes détaillées :

### Étape 1 : Créer un dossier pour le lab
1. Ouvrez votre terminal.
2. Tapez la commande suivante pour créer un dossier nommé `lab-5` :
   ```bash
   mkdir lab-5
   ```

### Étape 2 : Naviguer dans le dossier
1. Déplacez-vous dans le dossier `lab-5` que vous venez de créer :
   ```bash
   cd lab-5
   ```

### Étape 3 : Créer un fichier Vagrantfile
1. Dans le dossier `lab-5`, créez un fichier nommé `Vagrantfile` :
   ```bash
   touch Vagrantfile
   ```
2. Ouvrez le fichier `Vagrantfile` avec votre éditeur de texte préféré (par exemple, `nano`, `vim`, `code` pour Visual Studio Code, etc.) :
   ```bash
   nano Vagrantfile
   ```

### Étape 4 : Configurer le fichier Vagrantfile
1. Copiez et collez le contenu suivant dans le fichier `Vagrantfile` :

   ```ruby
   Vagrant.configure("2") do |config|
     # Configuration de la VM lb
     config.vm.define "lb" do |lb|
       lb.vm.box = "ubuntu/xenial64"
       lb.vm.hostname = "lb"
       lb.vm.network "private_network", ip: "10.0.0.10"
       lb.vm.provider "virtualbox" do |vb|
         vb.memory = "1024"
         vb.cpus = 1
       end
     end

     # Configuration de la VM web1
     config.vm.define "web1" do |web1|
       web1.vm.box = "ubuntu/xenial64"
       web1.vm.hostname = "web1"
       web1.vm.network "private_network", ip: "10.0.0.11"
       web1.vm.provider "virtualbox" do |vb|
         vb.memory = "1024"
         vb.cpus = 1
       end
     end

     # Configuration de la VM web2
     config.vm.define "web2" do |web2|
       web2.vm.box = "ubuntu/xenial64"
       web2.vm.hostname = "web2"
       web2.vm.network "private_network", ip: "10.0.0.12"
       web2.vm.provider "virtualbox" do |vb|
         vb.memory = "1024"
         vb.cpus = 1
       end
     end
   end
   ```

2. Enregistrez et fermez le fichier (dans `nano`, vous pouvez utiliser `Ctrl+O` pour enregistrer et `Ctrl+X` pour quitter).

### Étape 5 : Démarrer les machines virtuelles
1. Toujours dans le terminal et dans le dossier `lab-5`, exécutez la commande suivante pour démarrer les VMs :
   ```bash
   vagrant up
   ```
   Cette commande téléchargera l'image `ubuntu/xenial64` si ce n'est pas déjà fait et configurera les trois machines virtuelles selon les spécifications du `Vagrantfile`.

### Étape 6 : Connexion en SSH aux VMs
1. Pour vous connecter en SSH à chaque VM, utilisez les commandes suivantes :

   Pour la VM `lb` :
   ```bash
   vagrant ssh lb
   ```

   Pour la VM `web1` :
   ```bash
   vagrant ssh web1
   ```

   Pour la VM `web2` :
   ```bash
   vagrant ssh web2
   ```

2. Une fois connecté, vous pouvez exécuter les commandes nécessaires pour configurer ou tester vos serveurs Web.

### Étape 7 : Arrêter et supprimer les VMs
1. Pour arrêter les machines virtuelles, utilisez la commande suivante :
   ```bash
   vagrant halt
   ```

2. Pour supprimer les machines virtuelles et libérer l'espace disque, utilisez la commande suivante :
   ```bash
   vagrant destroy
   ```

En suivant ces étapes, vous devriez être en mesure de déployer, configurer, et gérer trois machines virtuelles avec Vagrant.