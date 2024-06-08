# Jenkins in Docker

This repository provides detailed instructions for setting up a Jenkins server using Docker.

## Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop) must be installed on your machine.

## Steps to Run Jenkins in Docker

### Step 1: Install Docker

If Docker is not already installed on your machine, you can install it by following the instructions on the [Docker installation page](https://docs.docker.com/get-docker/).

### Step 2: Pull the Jenkins Docker Image

Open your terminal and run the following command to pull the Jenkins image from Docker Hub:

```sh
docker pull jenkins/jenkins:lts
```

### Step 3: Run the Jenkins Container

Run the Jenkins container with the following command:

```sh
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --name jenkins jenkins/jenkins:lts
```
