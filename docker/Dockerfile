# Use the official ROS2 image as the base image
FROM ros:foxy-ros-core
LABEL maintainer="Dave van der Meer <dave.vandermeer@uni.lu>"

RUN useradd -ms /bin/bash leo

# Install ROS2 packages
RUN apt update && \
apt install -y \
build-essential \
libboost-serialization1.71-dev \
ros-foxy-image-common \
ros-foxy-cv-bridge \
ros-foxy-tf2-geometry-msgs \
python3-colcon-common-extensions \
libeigen3-dev \
vim \
gcc \
git && \
rm -rf /var/lib/apt/lists/*

USER leo
WORKDIR /home/leo

RUN mkdir -p orbslam2_ws/

WORKDIR /home/leo/orbslam2_ws/

RUN git clone -b ros2 https://github.com/appliedAI-Initiative/orb_slam_2_ros.git

WORKDIR /home/leo/orbslam2_ws/
RUN /bin/bash -c "source /opt/ros/foxy/setup.bash; colcon build"
RUN mkdir -p /home/leo/ros2_ws/src/

# Set up entrypoint to source ROS2 setup files
USER root
COPY entrypoint.sh /home/leo/
RUN chmod +x /home/leo/entrypoint.sh
ENTRYPOINT ["/home/leo/entrypoint.sh"]
USER leo

# Set the default command to run when the container starts
CMD ["bash"]