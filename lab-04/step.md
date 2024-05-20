Pour déployer un serveur web en suivant les instructions données, voici les étapes détaillées :

### 1. Créez un dossier `lab-4`
Ouvrez votre terminal et utilisez la commande suivante pour créer un nouveau dossier appelé `lab-4` :

```bash
mkdir lab-4
```

### 2. Déplacez-vous dans ce dossier
Changez votre répertoire courant pour le dossier `lab-4` :

```bash
cd lab-4
```

### 3. Créez un Vagrantfile
Un fichier Vagrantfile est nécessaire pour configurer la machine virtuelle (VM). Créez ce fichier dans le dossier `lab-4` avec les informations suivantes :

- Image de base : CentOS 7 par Geerlingguy
- CPU : 2
- RAM : 2 Go
- IP fixe privée : 10.0.0.10

Créez le fichier `Vagrantfile` avec les contenus suivants :

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "geerlingguy/centos7"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end
  config.vm.network "private_network", ip: "10.0.0.10"
end
```

### 4. Variables des paramètres indiquées
Pour rendre les paramètres de CPU et RAM variables, modifiez le fichier `Vagrantfile` comme suit :

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "geerlingguy/centos7"
  
  cpus = 2
  memory = 2048
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = memory
    vb.cpus = cpus
  end
  
  config.vm.network "private_network", ip: "10.0.0.10"
end
```

### 5. Démarrez la machine virtuelle et connectez-vous en SSH
Démarrez la VM avec Vagrant :

```bash
vagrant up
```

Une fois la VM démarrée, connectez-vous en SSH :

```bash
vagrant ssh
```

### 6. Installez Nginx
Après vous être connecté à la VM via SSH, installez Nginx avec les commandes suivantes :

```bash
sudo yum update -y
sudo yum install -y epel-release
sudo yum install -y nginx
```

Démarrez le service Nginx :

```bash
sudo systemctl start nginx
```

Activez Nginx pour qu'il démarre automatiquement au démarrage du système :

```bash
sudo systemctl enable nginx
```

### 7. Vérifiez l'accès à l'application depuis le PC local
Sur votre navigateur, allez à l'adresse suivante pour vérifier que Nginx est en cours d'exécution :

```plaintext
http://10.0.0.10
```

Vous devriez voir la page par défaut de Nginx.

### 8. Arrêtez la VM puis supprimez-la
Pour arrêter la VM, utilisez :

```bash
vagrant halt
```

Ensuite, pour supprimer la VM et libérer les ressources :

```bash
vagrant destroy
```

Voilà, vous avez maintenant déployé et vérifié un serveur web sur une VM en utilisant Vagrant et Nginx !