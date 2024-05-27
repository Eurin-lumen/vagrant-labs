Bien sûr, Eurin. Je vais te guider pas à pas pour réaliser ce lab-9 : Installation de nginx à l’aide d’Ansible.

### Étape 1 : Créez un dossier `lab-9`
```sh
mkdir lab-9
```

### Étape 2 : Déplacez-vous dans ce dossier
```sh
cd lab-9
```

### Étape 3 : Créez un `Vagrantfile` avec la configuration suivante

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "private_network", ip: "10.0.0.10"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "nginx.yaml"
  end
end
```

### Étape 4 : Créez le playbook Ansible `nginx.yaml`

```yaml
---
- name: Installer et démarrer nginx
  hosts: all
  become: yes
  tasks:
    - name: Mettre à jour les paquets APT
      apt:
        update_cache: yes
    
    - name: Installer nginx
      apt:
        name: nginx
        state: present
    
    - name: Démarrer nginx
      service:
        name: nginx
        state: started
        enabled: yes
```

### Étape 5 : Lancez Vagrant pour créer et configurer la VM
```sh
vagrant up
```

### Étape 6 : Vérifiez que la page par défaut de nginx est bien accessible

- Ouvrez un navigateur web et entrez l'adresse suivante : `http://10.0.0.10`
- Vous devriez voir la page par défaut de nginx.

### Étape 7 : Arrêtez et supprimez la VM

```sh
vagrant halt
vagrant destroy -f
```

### Récapitulatif des fichiers et commandes :

- **Créez le dossier et déplacez-vous dedans**
  ```sh
  mkdir lab-9
  cd lab-9
  ```

- **Créez le `Vagrantfile`**

  ```ruby
  Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.network "private_network", ip: "10.0.0.10"
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end

    config.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "nginx.yaml"
    end
  end
  ```

- **Créez le playbook Ansible `nginx.yaml`**

  ```yaml
  ---
  - name: Installer et démarrer nginx
    hosts: all
    become: yes
    tasks:
      - name: Mettre à jour les paquets APT
        apt:
          update_cache: yes

      - name: Installer nginx
        apt:
          name: nginx
          state: present

      - name: Démarrer nginx
        service:
          name: nginx
          state: started
          enabled: yes
  ```

- **Lancez Vagrant**
  ```sh
  vagrant up
  ```

- **Accédez à la page par défaut de nginx via le navigateur**
  ```http
  http://10.0.0.10
  ```

- **Arrêtez et supprimez la VM**
  ```sh
  vagrant halt
  vagrant destroy -f
  ```

Si tu as des questions ou des difficultés à un moment donné, n'hésite pas à demander !