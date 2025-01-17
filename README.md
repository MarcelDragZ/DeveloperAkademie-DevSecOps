# Project: Conduit Application Setup with Docker

<div align="center">

![Docker version](https://img.shields.io/badge/Docker-20.10.8-blue) ![Conduit version](https://img.shields.io/badge/Conduit-2024-green)

</div>

## Table of Contents

- [Project: Conduit Application Setup with Docker](#project-conduit-application-setup-with-docker)
  - [Table of Contents](#table-of-contents)
  - [Environment Setup](#environment-setup)
  - [Description](#description)
  - [Quickstart Guide](#quickstart-guide)
  - [Deployment Details](#deployment-details)
  - [Usage](#usage)
  - [Useful Links](#useful-links)
  - [Troubleshooting](#troubleshooting)
    - [Bash Script Line Ending Issue](#bash-script-line-ending-issue)
      - [Convert Line Endings:](#convert-line-endings)

## Environment Setup

Before starting the application, ensure you have created a `.env` file in the root directory with the following content:

```env
DJANGO_SUPERUSER_USERNAME=superuser
DJANGO_SUPERUSER_PASSWORD=superuser_password
DJANGO_SUPERUSER_EMAIL=superuser@gmx.de
API_URL=http://localhost:8000
```

This file stores environment variables necessary for the Conduit services, such as database credentials and other configuration details.

- You can also use the `sample.env` file by copying it:

```sh
cp sample.env .env
```

---

## Description

This repository contains the configuration and setup files for running the Conduit application with Docker. The setup is optimized to provide a seamless installation, with persistent data storage and a pre-configured environment for efficient deployment.

## Quickstart Guide

Follow these steps to quickly get your Conduit application up and running:

1. **Clone the repository**:

   ```bash
   git clone <REPOSITORY_URL>
   ```

2. **Navigate to the project directory**:

   ```bash
   cd conduit-container
   ```

3. **Start the application**:
   Use Docker Compose to spin up the Conduit services:

   ```bash
   docker-compose up -d
   ```

4. **Access the Conduit Application**:
   Once the services are running, open your web browser and navigate to:

   - **URL**: `http://<IP-ADDRESS>:8282`

   Follow the setup instructions in the browser if necessary.

5. **Troubleshooting**:

   If you encounter any issues, check the Docker logs for details:

   ```bash
   docker-compose logs
   ```

## Deployment Details

To deploy the Conduit application to a Cloud-VM instance via GitHub Actions, ensure the following steps are completed:

1. **GitHub Secrets**:
   Configure the following secrets in your GitHub repository:

   - `SERVER_IP`: The IP address of your server.
   - `USER`: The username for SSH access.
   - `SSH_PRIVATE_KEY`: The private key for SSH authentication.
   - `REPO_URL`: The URL of your Git repository.
   - `PROJECT_PATH`: The path on the server where the project will be deployed.

2. **Environment File**:

   - Customize the `sample.env` file with the correct server configuration and copy it as `.env`:
     ```sh
     cp sample.env .env
     ```

3. **SSH Key Pair**:

   - Ensure your SSH key pair is correctly set up and that the public key is added to your server's authorized keys.

4. **Workflow**:

   - The GitHub Actions workflow file `deployment.yaml` in `.github/workflows` handles the following:
     - Establishes an SSH connection to the server.
     - Clones or updates the repository on the server.
     - Starts the containerized application using `docker-compose` in detached mode.
     - Stops and cleans up any existing containers before starting new ones.

5. **Validation**:
   - Verify that the application is running by accessing the designated URL.
   - Use `docker-compose ps` to ensure containers are up and running.

## Usage

This section provides an overview of the `docker-compose.yaml` configuration and explains how to adjust the setup:

- **Volumes**:  
  The configuration includes volume mounts to ensure that application data is stored persistently on your host system.

- **Networking**:  
  The services are configured to run within the same Docker network, ensuring smooth communication between components.

- **Restart Policy**:  
  The services will automatically restart if any unexpected errors occur, providing a stable setup.

## Useful Links

- [Conduit Documentation](https://docs.conduit.io)
- [Docker Documentation](https://docs.docker.com/)

## Troubleshooting

### Bash Script Line Ending Issue

If you encounter an error like:
`/usr/bin/env: ‘bash\r’: No such file or directory`

This error is caused by Windows-style line endings (CRLF) in the entrypoint.sh file. Convert them to Unix-style line endings (LF):

#### Convert Line Endings:

**Using a Text Editor**:

- Open `entrypoint.sh` in a text editor like Visual Studio Code.
- Change the line endings from `CRLF` to `LF` (this option is usually found in the bottom right corner of VS Code).
