# V-Server Setup Guide

## Table of Contents

1. [SSH Key Setup](#ssh-key-setup)
2. [Disable Password Login](#disable-password-login)
3. [Install NGINX](#install-nginx)
4. [Configure NGINX](#configure-nginx)
5. [Configure Git](#configure-git)

## Prerequisites

- Access to a V-Server
- SSH client on your local machine
- Basic knowledge of Linux commands
- Git installed on your local machine

## SSH Key Setup

1. **Generate an SSH key pair on your local machine:**

   ```sh
   ssh-keygen -t rsa
   ```

   For higher security you can alternatively use:

   ```sh
   ssh-keygen -t ed25519
   ```

   The default location for the generated keys is:

   - **Windows:** `C:\Users\marce\.ssh\id_rsa` (private key) and `C:\Users\marce\.ssh\id_rsa.pub` (public key)
   - **Linux:** `~/.ssh/id_rsa` (private key) and `~/.ssh/id_rsa.pub` (public key)

2. **Add your SSH public key to the V-Server:**

   Linux:

   ```sh
   ssh-copy-id -i ~/.ssh/id_rsa.pub mherzog@188.245.36.39
   ```

   Windows:

   ```powershell
   $pubKey = Get-Content -Path "$env:USERPROFILE\.ssh\id_rsa.pub" -Raw
   ssh mherzog@188.245.36.39 "echo $pubKey >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
   ```

   Alternatively, you can manually copy the generated `id_rsa.pub`:

   - Open the file on your local machine and copy the key
   - On the server: `nano /home/mherzog/.ssh/authorized_keys`
   - Paste the copied key into the file and save

3. **Verify SSH key-based login:**

   ```sh
   ssh mherzog@188.245.36.39
   ssh -o PubKeyAuthentication=yes mherzog@188.245.36.39
   ssh -i C:\Users\marce\.ssh\id_rsa mherzog@188.245.36.39
   ```

## Disable Password Login

Disable the password for higher security on the server.

1. **Edit the SSH configuration file:**

   ```sh
   sudo nano /etc/ssh/sshd_config
   ```

2. **Disable password authentication + activate PubkeyAuthentication:**
   Before setting up the config. These lines were set with `#` before:

   ```sh
   # PasswordAuthentication yes
   # PubkeyAuthentication yes
   ```

   After you set up the config:

   ```sh
   PasswordAuthentication no
   PubkeyAuthentication yes
   ```

3. **Restart SSH service:**

   ```sh
   sudo systemctl restart sshd
   ```

## Install NGINX

1. **Update package lists:**

   ```sh
   sudo apt update
   ```

2. **Install NGINX:**

   ```sh
   sudo apt install nginx
   ```

3. **Start and enable NGINX service:**

   ```sh
   sudo systemctl start nginx
   sudo systemctl enable nginx
   ```

   Go to the web browser and check if nginx is running: `http://188.245.36.39/`

## Configure NGINX

1. **Edit the default NGINX configuration:**

   ```sh
   sudo nano /etc/nginx/sites-available/default
   ```

2. **Modify the server block to serve your custom HTML page:**

   ```conf
   server {
       listen 80 default_server;
       listen [::]:80 default_server;

       root /home/devsecops/v-server-setup; # change this line
       index index.html;

       server_name _;

       location / {
           try_files $uri $uri/ =404;
       }
   }
   ```

## Configure Git

1. **Set up Git with your user details:**

   ```sh
   git config --global user.name "<Username>"
   git config --global user.email "<E-Mail>"
   ```

2. **Generate an SSH key pair for GitHub on the server:**

   ```sh
   ssh-keygen -t rsa
   ```

   For higher security you can alternatively use:

   ```sh
   ssh-keygen -t ed25519
   ```

   The default location for the generated keys is:

   - **Windows:** `C:\Users\marce\.ssh\id_rsa` (private key) and `C:\Users\marce\.ssh\id_rsa.pub` (public key)
   - **Linux:** `~/.ssh/id_rsa` (private key) and `~/.ssh/id_rsa.pub` (public key)

3. **Add the SSH public key to your GitHub account:**

   ```sh
   cat ~/.ssh/id_rsa.pub
   ```

   - Copy the output and add it to your GitHub (settings => SSH keys and GPG keys => SSH keys.)

4. **Clone existing git repository with index.html:**

   ```sh
   git clone git@github.com:MarcelDragZ/DeveloperAkademie-DevSecOps.git devsecops
   ```

   Set the rights to the directory:

   ```sh
   sudo chmod 755 /home/mherzog
   sudo chmod 755 /home/mherzog/devsecops
   ```

## Check Nginx config

```sh
sudo nginx -t
```

## Restart NGINX to apply changes and reload the own index.html

```sh
sudo systemctl restart nginx
```
