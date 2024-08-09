# Project: Babyshop Django App with Docker

This document provides a comprehensive guide for setting up and running the Babyshop Django application in a Docker container with persistent data storage.

## Table of Contents

1. [Create requirements.txt](#create-requirementstxt)
2. [Create .env File](#create-env-file)
3. [Edit settings.py with static root and allowed hosts](#add-static-root-to-settingspy)
4. [Setup Persistent Storage](#setup-persistent-storage)
5. [Build Docker Image](#build-docker-image)
6. [Run Docker Container](#run-docker-container)
7. [Project Overview](#project-overview)
8. [Hints](#hints)
9. [Photos](#photos)

## Create requirements.txt

Create a `requirements.txt` file in the root directory of your project with the following content:

```
Django==4.0.2
gunicorn==20.1.0
Pillow
```

You can use this requirements.txt by creating a virtual-environment

```sh
python -m venv env

```

And install the requirements after into the env

```sh

pip install -r requirements.txt
```

## Create .env File

Create a `.env` file in the root directory of your project with the following content:

```env
DJANGO_SUPERUSER_USERNAME=admin
DJANGO_SUPERUSER_EMAIL=admin@admin.de
DJANGO_SUPERUSER_PASSWORD=admin
DJANGO_PORT=8025
```

## Add Static Root to settings.py

Add the following line to your `settings.py` file to configure the static root:

```python
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Changing the following line to allow all hosted locations

```python
ALLOWED_HOSTS = ['*']
```

## Setup Persistent Storage

To ensure that your data persists even after restarting the container, follow these steps:

### Windows

1. Create a Docker volume:

   ```sh
   docker volume create babyshop_data
   ```

### Linux

1. Create a Docker volume:

   ```sh
   docker volume create babyshop_data
   ```

## Build Docker Image

A `Dockerfile` is already provided in the project. Build the Docker image using the following command:

- With .env file on Linux

```sh
export $(grep -v '^#' .env | xargs)

docker build --build-arg DJANGO_SUPERUSER_USERNAME=$DJANGO_SUPERUSER_USERNAME \
             --build-arg DJANGO_SUPERUSER_EMAIL=$DJANGO_SUPERUSER_EMAIL \
             --build-arg DJANGO_SUPERUSER_PASSWORD=$DJANGO_SUPERUSER_PASSWORD \
             -t babyshop .
```

- With .env file on Windows

```powershell
Get-Content .env | ForEach-Object {
    $name, $value = $_ -split '='
    Set-Item -Path "Env:$name" -Value $value
}

docker build --build-arg DJANGO_SUPERUSER_USERNAME=$Env:DJANGO_SUPERUSER_USERNAME `
             --build-arg DJANGO_SUPERUSER_EMAIL=$Env:DJANGO_SUPERUSER_EMAIL `
             --build-arg DJANGO_SUPERUSER_PASSWORD=$Env:DJANGO_SUPERUSER_PASSWORD `
             -t babyshop .
```

- Without .env file (you'll need to update the dockerfile for)
- For Linux and Windows

```sh
docker build -t babyshop .
```

## Run Docker Container

Run the Docker container using the following commands:

- Without persistent storage:

  ```sh
  docker run -d -p 8025:8025 babyshop
  ```

- With persistent storage:

  ```sh
  docker run -d -p 8025:8025 -v babyshop_data:/app/babyshop_app babyshop
  ```

## Project Overview

This section covers the E-Commerce project for Baby Tools.

### TECHNOLOGIES

- Python 3.9
- Django 4.0.2
- Venv

## Hints

This section will cover some hot tips when trying to interact with this repository:

- Settings & Configuration for Django can be found in `babyshop_app/babyshop/settings.py`
- Routing: Routing information, such as available routes can be found from any `urls.py` file in `babyshop_app` and corresponding subdirectories

## Photos

##### Home Page with login

![Home Page with login](https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080815407.jpg)

##### Home Page with filter

![Home Page with filter](https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080840305.jpg)

##### Product Detail Page

![Product Detail Page](https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080934541.jpg)

##### Home Page with no login

![Home Page with no login](https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080953570.jpg)

##### Register Page

![Register Page](https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081016022.jpg)

##### Login Page

![Login Page](https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081044867.jpg)
