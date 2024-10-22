# Project: Minecraft Server Setup with Docker

<div align="center">

![Docker version](https://img.shields.io/badge/Docker-20.10.8-blue) ![Minecraft version](https://img.shields.io/badge/Minecraft_Server-1.21.1-green)

</div>

## Table of Contents

1. [Description](#description)
2. [Prerequisites](#prerequisites)
3. [Quickstart Guide](#quickstart-guide)
4. [Useful Links](#useful-links)

## Description

This repository contains the configuration and setup files for running a Minecraft server using Docker. The server is pre-configured to handle persistent data and allow external connections, so you can easily set up your own Minecraft server with minimal effort.

## Prerequisites

Before starting, make sure you have the following installed:

- Docker (version 20.10.8 or higher)
- Docker Compose
- A working internet connection
- Sufficient disk space for game saves and server files

## Quickstart Guide

Follow these steps to quickly get your Minecraft server up and running:

1. **Clone the repository**:

   ```bash
   git clone <REPOSITORY_URL>
   ```

2. **Navigate to the project directory**:

   ```bash
   cd minecraft-server
   ```

3. **Start the server**:
   Use Docker Compose to spin up the server:

   ```bash
   docker-compose up -d
   ```

4. **Connect to the server**:
   Once the server is running, open Minecraft and connect to the server using your <IP-Address> on port 8888.

5. **Access the Server**:
   Once the server is running, use the following IP address and port to connect from your Minecraft client:

- **Server IP**: `IP-ADDRESS`
- **Port**: `8888`

  Make sure your firewall settings allow connections on this port.

6. **Troubleshooting**:

   If you encounter any issues, check the Docker logs for details:

```bash
docker-compose logs
```

## Useful Links

- [Minecraft Server Download](https://www.minecraft.net/de-de/download)
- [Docker Documentation](https://docs.docker.com/)
- [How to Run Minecraft Server in Docker](https://www.howtogeek.com/devops/how-to-run-a-minecraft-server-in-docker/)
