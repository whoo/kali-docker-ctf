## 🚀 Démarrage Rapide : Conteneur Kali Linux Personnalisé

Ce guide explique comment construire et exécuter un conteneur Docker basé sur Kali Linux avec une configuration personnalisée pour l'utilisateur **kali** en utilisant les fichiers `Dockerfile` et `Run.sh` fournis.

### Prérequis

* **Docker** : Doit être installé et en cours d'exécution sur votre système.
* Les deux fichiers suivants (`Dockerfile` et `Run.sh`) doivent être dans le même répertoire.

***

### 0. Tu veux pas tout lire

* ./Run.sh build
* ./Run.sh 

(partage le répertoire $HOME/docker-home-kali)


### 1. Structure du Conteneur

Le `Dockerfile` est configuré pour :
* Utiliser l'image de base `kalilinux/kali-rolling:amd64`.
* Installer des paquets essentiels et de sécurité, y compris `build-essential`, `python3`, `nmap`, `curl`, et `kali-linux-headless`.
* Configurer les locales (`en_US.UTF-8`) et installer **Oh My Zsh** avec le thème `agnoster`.
* Installer des outils Python via `pip` (`requests`, `pwntools`, `pycryptodome`).
* Créer un utilisateur **kali** avec le shell Zsh (`/bin/zsh`).
* Accorder à l'utilisateur **kali** les privilèges **sudo sans mot de passe**.

***

### 2. Le Script `Run.sh`

Le script `Run.sh` automatise les étapes de construction (optionnelle), de création et de connexion au conteneur.

#### Variables Clés et Configuration

* `P="$HOME/docker-home-kali"` : Définit le chemin du répertoire hôte qui sera monté dans le conteneur en tant que `/home/kali` (le répertoire personnel de l'utilisateur `kali`).

#### Fonctionnement du Script

1.  **Construction** : Si le script est exécuté avec un argument (ex: `./Run.sh build`), il lance `docker build -t ihack .` pour construire l'image et la taguer en **`ihack`**.
2.  **Vérification et Démarrage** : Il vérifie si un conteneur nommé **`ihack`** existe et est arrêté. Si c'est le cas
