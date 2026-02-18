This project has been created as part of the 42 curriculum by acoste

# Inception

## Welcome to my Inception project

### Description

This project consists of having you set up a small infrastructure composed of different services under specific rules.

Mandatory part is compose of :
 - The install of Nginx who will hostour website
 - WorPress Website who will present our blog
 - MariaDB database who will store our Wordpress Data

All of this throught a bind-mount docker, each service has it own container.

---

### Instructions

You should use the 'Makefile' for executing the 'docker-compose.yml' file.

When you wan't to start the dockers
````sh
make up
````
When you wan't to stop the dockers
````sh
make down
````
To clean up images
````sh
make clean
````
To clean up images + containers
````sh
make fclean
````
To clean all and restart all your services
````sh
make re
````

---

### Ressources

Dockerfiles doc :  https://docs.docker.com/reference/dockerfile/

Install services and use Docker exec -it <container> /bin/bash
replace <container> with the name of your docker or use docker ps when your docker is launch replace it with the ID of your container

Then search into all configs files of the services, look throught commentary they are realy helpfull

AI use : Indentation level in docker-compose, verification of global variable with .env file, modelisation of the network project to clarify it, debugging purpose for MariaDB startup and link with wordpress

---

### Project description

Inception is a project that require a lot of understanding of docker, we have to setup :

A docker container that contains NGINX with TLSv.2 or TLSv.3

An other docker that contains MariaDB

A volume that contains WordPress database

A second volume that contains WordPress database

This two volumes need to be named and their data should be store inside /home/acoste/data

We need to create a docker-network that establishes the connection between our containers and they must restart in case of a crash

Wordpress should have 2 users, one of them being the administrator

and some others ligther obligations

Thought the conception of all the project, you will have to learn how Dockerfile are made, how docker-compose work, the implementation of a serveur, website and database, communication between services, configuration files and a some more, it's a very didactic projet

#### Virtual Machines vs Docker

Containers are lightweight software packages that contain all the dependencies required to execute the contained software application.
The principal differencies between containers and Virtual Machines (VM) is that VM have their own operating system kernel to execute the system procesess where has docker use the host machine as a kernel dependencies to executes commands.

VM is great cause it assure full isolation from your system but take more space on disk storage, is more slow to launch and are more ressources requesting
Whereas on the other part, docker is more quick to start, provide a very fast modifiable environnement and are lightweight but their are all on the same underlying hardware system witch can be dangerous throught nefarious actors and can implicated some bugs if kernels aren't both linux related operating system

#### Secrets vs Environment Variables

In docker-compose file, you can choose either to hard code your environnement variable or to pass them as a file .env classified secret.
Environment variable are injected into the container at runtime and accessible in any process inside it. It's more likely than someone could dump the variables than the secrets file. This file is use inside that container at a specific space and the user didn't have the reading rights on it. Making it safer

#### Docker Network vs Host Network

For Docker Network, Docker creates an isolated network for containers to communicate with each other while keeping them separate from the host machine.

On host Network, the container shares the host machine’s network stack directly

The Docker network is great for isolation and security cause containers get their own IP addresses, but more complexe cause external access require port mapping (-p)

Host network offer a slightly better network performance because their is no NAT (network address translation) but has no IP isolation and is less secure cause it can give a full network access

#### Docker Volumes vs Bind Mounts

Docker Volumes are manages entirely by Docker
The data lives in Docker's own storage area (/var/lib/docker/volumes/ on Linux), and you don't need to worry about the host filesystem structure.

A bind mount maps a specific path on the host directly into the container. Whatever is at that host path is what the container sees.
It is particularly useful cause the host and container share the exact same files in real time, for development if you edit a file, your container will be edited inside of it.
This solution is less portable cause the path can depand on the user filesystem witch can cause conflict

---