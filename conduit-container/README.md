# Project: Conduit Application Setup with Docker

<div align="center">

![Docker version](https://img.shields.io/badge/Docker-20.10.8-blue) ![Conduit version](https://img.shields.io/badge/Conduit-2024-green)

</div>

## Table of Contents

1. [Environment Setup](#environment-setup)
2. [Description](#description)
3. [Quickstart Guide](#quickstart-guide)
4. [Usage](#usage)
5. [Useful Links](#useful-links)
6. [Troubleshooting](#troubleshooting)

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
