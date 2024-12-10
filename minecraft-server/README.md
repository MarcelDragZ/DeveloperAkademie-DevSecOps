# Project: Minecraft Server Setup with Docker

<div align="center">

![Docker version](https://img.shields.io/badge/Docker-20.10.8-blue) ![Minecraft version](https://img.shields.io/badge/Minecraft_Server-1.21.1-green)

</div>

## Table of Contents

1. [Description](#description)
2. [Prerequisites](#prerequisites)
3. [Quickstart Guide](#quickstart-guide)
4. [Extending the Installation](#extending-the-installation)
5. [Troubleshooting](#troubleshooting)
6. [Useful Links](#useful-links)

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

## Extending the Installation

Adding Mods or Plugins

1. **Locate the Mods Folder**:

   - Navigate to the `mods` or `plugins` directory inside your server's volume.
   - Example: `/path/to/your/server/mods`

2. **Install Mods/Plugins**:

   - Ensure that the mods or plugins are compatible with your Minecraft version.
   - Download Mods/Plugins
   - Copy the downloaded files into the appropriate folder.

3. **Restart the Server**:
   - Restart the Docker container to apply the changes:
     ```bash
     docker-compose restart
     ```

Adjusting Multiplayer Settings

1. **Edit `server.properties`**:

   - Modify the settings directly in the `server.properties` file.

2. **Common Settings**:

   - `max-players`: Adjust the maximum number of players.
   - `motd`: Customize the server's Message of the Day.
   - `difficulty`: Change the game difficulty (`easy`, `normal`, `hard`).

3. **Apply Changes**:
   - Save the file and restart the server using:
     ```bash
     docker-compose restart
     ```

## Troubleshooting

1. **Connection Issues**:

   - Verify that the server is running and the correct ports are open.
   - Use `docker-compose logs` to diagnose potential errors.

2. **Mod/Plugin Compatibility**:

   - Check if the mods or plugins match the server's Minecraft version.

3. **Performance Problems**:

   - Increase allocated memory in your `docker-compose.yml` or adjust server settings.

4. **Other Logs**:
   - Inspect additional logs for detailed error messages using:
     ```bash
     docker logs <container_name>
     ```
   - For more comprehensive logs, you can use:
     ```bash
     docker-compose logs
     ```

## Useful Links

- [Minecraft Server Download](https://www.minecraft.net/de-de/download)
- [Docker Documentation](https://docs.docker.com/)
- [How to Run Minecraft Server in Docker](https://www.docker.com/blog/minecraft-server-docker-1/)
