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

# Jenkins Docker Permission Issue Resolution

This guide outlines the steps to resolve the "permission denied" error when Jenkins tries to connect to the Docker daemon.

## Steps to Resolve Permission Denied Error

### 1. Add Jenkins User to Docker Group

The Jenkins user needs to be part of the Docker group to run Docker commands. Execute the following command to add the Jenkins user to the Docker group:

```bash
sudo usermod -aG docker jenkins
```

After adding the Jenkins user to the Docker group, restart Jenkins for the changes to take effect:

```bash
sudo systemctl restart jenkins
```

### 2. Verify Docker Group Membership

Ensure that the Jenkins user is part of the Docker group:

```bash
groups jenkins
```

This command should list `docker` among the groups.

### 3. Check Docker Socket Permissions

Verify that the Docker socket has the appropriate permissions:

```bash
ls -l /var/run/docker.sock
```

The output should show that the socket is owned by the `docker` group. If not, change the group ownership and permissions with:

```bash
sudo chown root:docker /var/run/docker.sock
sudo chmod 660 /var/run/docker.sock
```

### 4. Ensure Docker Daemon is Running

Ensure that the Docker daemon is running and set to start on boot:

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

### 5. Check SELinux/AppArmor Settings (if applicable)

If your system uses SELinux or AppArmor, ensure that these security modules are not blocking access to the Docker socket. Adjust the settings or policies as needed.

### 6. Restart Jenkins and Docker Services

After making these changes, restart both Jenkins and Docker services:

```bash
sudo systemctl restart jenkins
sudo systemctl restart docker
```

## Conclusion

Following these steps should resolve the permission denied error when Jenkins tries to connect to the Docker daemon. If the issue persists, check the Jenkins logs for more detailed error messages and troubleshoot accordingly.
