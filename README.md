# Project Name

A brief description of your Django project. This repository is intended for use in technical interviews and demonstrates the integration of Django, Docker, PostgreSQL, and Makefile for streamlined development and deployment.

## Table of Contents

- [Prerequisites](#prerequisites)
  - [Docker Setup](#docker-setup)
    - [Mac](#mac)
    - [Windows](#windows)
  - [Make Setup](#make)
    - [Mac](#mac-1)
    - [Windows](#windows-1)
- [Installation](#setting-up-the-application)
    - [Addition Commands](#additional-commands)


## Prerequisites

Before you begin, ensure you have the following software installed on your machine.

### Docker Setup

Docker is essential for containerizing the application and its dependencies.

#### Mac

1. **Download Docker Desktop for Mac**:
   - Visit the [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop) page.
   - Click on **Download for Mac**.

2. **Install Docker Desktop**:
   - Open the downloaded `.dmg` file.
   - Drag the Docker icon to the Applications folder.
   - Open Docker from the Applications folder and follow the on-screen instructions to complete the setup.

3. **Verify Installation**:
   ```bash
   docker --version
   docker-compose --version

#### Windows

1. **Download Docker Desktop for Windows**:
   - Visit the [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop) page.
   - Click on **Download for Windows**.

2. **Install Docker Desktop**:
   - Run the downloaded installer.
   - Follow the installation wizard steps.
   - Ensure that the **WSL 2** feature is enabled during installation for better performance.

3. **Verify Installation**:
   ```bash
   docker --version
   docker-compose --version

### Make

`make` is a build automation tool that allows you to manage and automate running commands, like building Docker images or running the Django server.

#### Installing Make on Windows

Windows users can install Make using Chocolatey, a package manager for Windows. If you don't have Chocolatey installed, follow the instructions on the [Chocolatey Install page](https://chocolatey.org/install). After installing Chocolatey, run the following command in an administrative command prompt:

```bash
choco install make
```

#### Installing Make on macOS

Make is usually pre-installed on macOS. If for some reason it is not installed, you can install it using Homebrew, a package manager for macOS. If you don't have Homebrew installed, follow the instructions on the [Homebrew website](https://brew.sh). Then, install Make using the following command in the terminal:

```bash
brew install make
```

## Setting Up the Application

Once you have Docker and Make installed, follow these steps to set up the application:

1. **Clone the Repository**

   Clone the project repository from GitHub using the following command:

   ```bash
   git clone <repository-url>
   ```

   Replace `<repository-url>` with the URL of the GitHub repository.

2. **Environment Variables**

   Create a copy of the `.env.sample` file and rename it to `.env`. Adjust the variables to match your local setup.

3. **Build the Docker Images**

   Use the `make` command to build the Docker images:

   ```bash
   make build
   ```

4. **Run the Application**

   Start the application using the following `make` command:

   ```bash
   make up
   ```

   This command will start all the services defined in your `docker-compose.yml` file.

   ```
5. **Apply Migrations**

   Apply the migrations to the database:

   ```bash
   make migrate

6. **Accessing the Application**

   Once everything is up and running, you can access the application by navigating to `http://localhost:8000` in your web browser.

7. **Stopping the Application**

   When you're done, you can stop the application using:

   ```bash
   make down
   ```

## Additional Commands

- To access the logs:

  ```bash
  make shell
  ```