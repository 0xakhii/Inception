# Inception

Inception is a Docker-based project aimed at providing a development environment that mirrors production as closely as possible. By using containerization, Inception ensures consistency across different stages of development and deployment, making it easier to maintain, test, and deploy applications.

## Table of Contents

1. [Overview](#overview)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Project Structure](#project-structure)
6. [Contributing](#contributing)
7. [License](#license)
8. [Contact](#contact)

## Overview

Inception uses Docker to create a modular and scalable development environment that can be easily adapted to different projects. This approach allows developers to quickly spin up and manage multiple services, ensuring a smooth transition from development to production.

## Requirements

To run Inception, you need the following software installed on your system:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Installation

1. Clone the repository:

    ```
    git clone https://github.com/yourusername/inception.git
    cd inception
    ```

2. Build the Docker containers:

    ```
    docker-compose build
    ```

3. Start the Docker containers:

    ```
    docker-compose up
    ```

4. The application should now be running on `http://localhost`.

## Usage

- **Starting the environment**: Use `docker-compose up` to start all the services.
- **Stopping the environment**: Use `docker-compose down` to stop all the services.
- **Rebuilding services**: If you make changes to the Docker configuration, use `docker-compose up --build` to rebuild the services.

## Project Structure

The Inception project is structured as follows:

inception/
├── srcs/
│ ├── requirements/
│ │ ├── mariadb/
│ │ │   ├── conf/
│ │ │   └── Dockerfile
│ │ ├── nginx/
│ │ │   ├── conf/
│ │ │   └── Dockerfile
│ │ └── wordpress/
│ │     ├── conf/
│ │     └── Dockerfile
│ └── bonus/
│   ├── adminer/
|      ├── Dockerfile
│   ├── cadvisor/
|      ├── Dockerfile
│   ├── redis/
|      ├── Dockerfile
│   ├── vsftpd/
|      ├── conf
|      ├── Dockerfile
│   └── website/
|      ├── conf
|      ├── Dockerfile
├── .env
├── docker-compose.yml
├── Makefile
- **requirements/**: Contains the core services like MariaDB, Nginx, and WordPress.
- **bonus/**: Contains additional services like Adminer, cAdvisor, Redis, vsftpd, and a custom website.
- **.env**: Contains environment variables used for configuration.
- **docker-compose.yml**: Defines the services, networks, and volumes.
- **Makefile**: Provides commands for building and managing the Docker environment.


## Contact

For any questions or suggestions, please contact ojamal710@gmail.com
