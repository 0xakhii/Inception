# Inception

Dive into system administration with Docker!
This project guides you through creating virtualized environments using Docker within a personal VM, expanding your knowledge and practical skills.

Get hands-on with containerization, building custom images, and managing applications efficiently.

# `Fisrt Of All`:

Docker is not a virtual machine, It is a mechanism to containerize applications and isolate the processes running these applications, Docker uses a feature in the kernel, it's NAMESPACES.
NameSpaces in the kernel:
A Linux namespace is a feature that Linux kernel provides to allow us to isolate resources for a set of processes, that give us two advantege:
Isolation of resources: One troublesome process won’t be taking down the whole host, it’ll only affect those processes belonging to a particular namespace.
Security: The other advantage is that a security flaw in the process or processes running under a given namespace, won’t give access to the attacker to the whole system.
Here Is A Quik Look To Know How NameSpaces Isolate Each Resource In Our System:
User namespace:
Contains an independent set of user IDs and group IDs that can be assigned to processes.
PID namespace
Contains its own set of process IDs (PIDs). Every time we create a new namespace, the process will get assigned PID 1. Every child process created in the new namespace will be assigned subsequent IDs.
Mount namespace
They allow the management of mount points in our system. Doing unmount in our new namespace won’t have any effect on the main host, as every new mount will be private to the current namespace.
Network namespace
Virtualises the network stack for the new namespace. This means that the new namespace will have its own virtual interface/s, private IPs, IP route table, sockets, etc.
IPC (Inter-Process Communication) namespace
Allows defining shared memory segments between processes within a namespace for inter-process communications, not interfering with other namespaces.
UTS (Unix Time-Sharing) namespace
Allows our system to have different host names and domain names for each namespace.
Time namespace
This namespace was released quite recently in Linux (2020), it allows having different system times within our system by specifying different time namespaces.
CGroup (Control Groups) namespace
Introduced in 2016 as part of Linux release 4.6, limits the resource usage in our system (cpu, memory, disk, etc) for a particular group of processes (under this namespace). As we will see in future articles, this is a very important feature of Linux Kernel in the containerised world we now live in.\
Notice:
Virtual machines are about isolating hardware, Docker is about isolating processes.

# `KeyWords`:

Dockerfile: a text document that contains all the commands a user could call on the command line to assemble an image.
Docker Image: created from a so called Dockerfile.
Docker Container: from the image the container can be created, we can say the container is a running instances of the image.
The Docker engine: the responsible for instantiating and running the containers.
Docker Volume is a mechanism to have a Docker managed file share between your container, You can map these volumes via so-called bind mounts into a container.
Docker Networking allows you to specify virtual Docker networks. Network traffic from and to containers is routed through a Docker proxy, This allows different setups for networking between individual containers.
Docker Compose is a feature to build and run several different containers from a single docker-compose.yml file, You can specify the exact images for the docker containers, the container names, networks, volumes and much more.

# `Docker Commands` :

`Basic Command Line For Docker`:
- docker ps or docker container ls -> `Show Cntrs Details`.
- docker build "The Path Of A Docker File Do You Want To Build Image With It" -> `build image`.
- docker built -t or --tag "Image Name" "PATH" -> `Build Image With Name`.
- docker kill "Image Name" -> `Stop An Image`.
- docker images or docker image ls -> `To see Docker Images`.
- docker pull "Image Name" -> `Pull An Image From Dockerhub`.
- docker start "Cntr Name" -> `Start Container`.
- docker stop "Cntr Name" -> `Stop Container`.
- docker container rm "Cntr Name" -> `Remove Cntr`.
- docker image rm "Image Name" -> `Remove Image`.
- docker system df -> `See All The Info About Cntrs, Images, Volumes, Cach`.
- docker exec -it "Cntr Name" "bash, sh..." -> `Execute The Program`.

`Docker run Commands`:
- docker run "Image Name" -> `To run the docker image to have a container`.
- docker run -d or --detach "Image Name"-> `Run container in background`.
- docker run -p -> `publish a container's port to the host`.
- docker run -P -> `publish all exposed port to random ports`.
- docker run -it "Image Name" -> `the program will continue to run and we will be able to interact with the container`.

# `DockerFile` :

`DockerFile Creation`:
- the docker file name should be like `Dockerfile` or `dockerfile`.
- Write your command inside the doc
- Build the dockerfile with the command "docker build -t "nameYouChoose"."
- Execute the dockerfile with the command: docker run "nameYouChoose"
- Here are the most common types of instructions:

`DockerFIle Commands`:
- FROM  - defines a base for your image. exemple : FROM debian
- RUN - executes any commands in a new layer on top of the current image and commits the result. RUN also has a shell form for running commands.
- WORKDIR - sets the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD instructions that follow it in the Dockerfile. (You go directly in the directory you choose)
- COPY - copies new files or directories from and adds them to the filesystem of the container at the path .
- CMD - lets you define the default program that is run once you start the container based on this image. Each Dockerfile only has one CMD, and only the last CMD instance is respected when multiple ones exist.