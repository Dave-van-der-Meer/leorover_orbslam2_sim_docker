# Leorover ORB-SLAM2 Sim Docker

Docker container to run ORB-SLAM2 for ROS2.


## Description

This repository is meant to be used together with the leorover_gazebo_sim_docker repository. It provides visual SLAM based on ORB-SLAM2 inside a Docker for ROS2. It is supposed to serve as an easy way to explore the workings of visual SLAM in a simulated environment. Additionally, it can serve as baseline to implement ORB-SLAM2 in ROS2 for a real system, contained in Docker. Using Docker is an interesting solution if the robot uses multpiple packages that are available on different ROS versions and it is an easy way to make the packages start at boot time of the robot.

## Installation

You need to have Docker Engine installed. If this is not the case, follow the instruction from the Docker installation page for Ubuntu or use the convenience installation scripts provided by Docker:

```shell-session
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh
```

After this, you may want to set up the environment so that you don't need to be superuser to run Docker:

```shell-session
$ sudo groupadd docker
$ sudo usermod -aG docker $USER
$ newgrp docker
```

Then, clone this repository:

```shell-session
$ git clone https://github.com/Dave-van-der-Meer/leorover_orbslam2_sim_docker.git
$ cd leorover_orbslam2_sim_docker
```

## Usage

To use this repository, you first have to clone the repository and then enter the source folder of the repository. To build the Docker image, enter the `docker` folder and use the script called `docker_build.sh`:

```shell-session
cd ./docker/
$ bash docker_build.sh
```

This will build the Docker image and this process can take some time. Next, if the image has been built successfully, go back to the root directory of this repository and run the image with the `docker_run.sh` script:

```shell-session
$ cd ../
$ bash ./docker/docker_run.sh
```

This will start the Docker container and automatically run ORB-SLAM2 pre-configured for the Leorover Gazebo Sim found [here](https://github.com/Dave-van-der-Meer/leorover_gazebo_sim_docker).


## Known bugs

It is knows that the TF tree of the entire setup with the simulation is a little odd sinve the TF tree will look as follows:

`map -> camera_link -> leorover/base_footprint`

The configuration file of ORB-SLAM2 that is being loaded is stating that the TF should be `map -> leorover/base_footprint` but this parameter file gets ignored. As a workaround, a static_tf_publisher node is running to connect the camera_link to the leorover/base_footprint.
