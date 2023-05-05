#!/bin/bash

set -e

export ROS2_INSTALL_PATH="/opt/ros/foxy"
export ROS_NAMESPACE="leo03"
export ROS_DOMAIN_ID=${ROS_DOMAIN_ID}

# setup ros2 environment
cd /home/leo/ros2_ws
source "/opt/ros/foxy/setup.bash"
colcon build --symlink-install
source "/home/leo/ros2_ws/install/local_setup.bash"
source "/home/leo/orbslam2_ws/install/local_setup.bash"

exec "$@"
