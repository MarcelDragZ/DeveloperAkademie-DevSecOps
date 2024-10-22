
# Project: Minecraft Server Setup with Docker

<div align="center">

![Docker version](https://img.shields.io/badge/Docker-20.10.8-blue) ![Minecraft version](https://img.shields.io/badge/Minecraft_Server-1.21.2-green)

</div>

## Quickstart Guide

Folge diesen Schritten, um deinen Minecraft-Server mit Docker einzurichten und zu starten:

1. **Repository klonen**:

   Zuerst musst du das Repository auf deinen Rechner klonen:

   ```bash
   git clone <REPOSITORY_URL>
   ```

2. **In das Projektverzeichnis wechseln**:

   Navigiere in das geklonte Verzeichnis:

   ```bash
   cd minecraft-server
   ```

3. **Server-Konfiguration überprüfen**:

   Stelle sicher, dass die Konfiguration in der `docker-compose.yml` Datei korrekt ist. Insbesondere überprüfe die Ports und Volumes, um sicherzustellen, dass sie deinen Anforderungen entsprechen:

   ```yaml
   services:
     minecraft:
       image: itzg/minecraft-server:latest
       ports:
         - "8888:25565"
       volumes:
         - ./minecraft_data:/data
   ```

4. **Server starten**:
   Starte den Minecraft-Server im Hintergrund mit Docker Compose:

   ```bash
   docker-compose up -d
   ```

   Dieser Befehl startet den Server im Hintergrund und erstellt die notwendigen Container.

5. **Überprüfen, ob der Server läuft**:

   Du kannst den Status des Servers mit dem folgenden Befehl prüfen:

   ```bash
   docker-compose ps
   ```

   Damit siehst du, ob der Server läuft und ob es Probleme gibt.

6. **Mit dem Server verbinden**:

   Sobald der Server läuft, kannst du Minecraft öffnen und dich mit der IP-Adresse deines Servers auf Port 8888 verbinden:

   - **Server IP**: Deine IP-Adresse
   - **Port**: 8888

   Stelle sicher, dass deine Firewall diesen Port für eingehende Verbindungen freigibt.

7. **Server-Logs prüfen**:

   Falls es Probleme gibt oder du die Aktivität des Servers überwachen möchtest, kannst du die Logs einsehen:

   ```bash
   docker-compose logs
   ```

8. **Server stoppen**:

   Um den Server zu stoppen, kannst du den folgenden Befehl ausführen:

   ```bash
   docker-compose down
   ```

   Dieser Befehl stoppt den Server und entfernt die laufenden Container, ohne die gespeicherten Daten zu verlieren.

## Hinweise

- Stelle sicher, dass Docker und Docker Compose auf deiner Maschine installiert und auf dem neuesten Stand sind.
- Der Server speichert alle Spieldaten im `minecraft_data` Verzeichnis, welches durch Docker als Volume gemountet wird. So bleiben deine Daten auch bei einem Neustart des Servers erhalten.

## Nützliche Links

- [Minecraft Server Download](https://www.minecraft.net/de-de/download)
- [Docker Documentation](https://docs.docker.com/)
- [Minecraft Docker Image von itzg](https://hub.docker.com/r/itzg/minecraft-server)

