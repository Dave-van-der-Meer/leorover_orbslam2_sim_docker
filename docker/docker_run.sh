#!/bin/bash
# xhost +local:docker
ROS_PACKAGE_PATH="$HOME/Documents/docker/leorover-docker/orb_slam2_ros2/leorover_orbslam2"

# Note: replace --restart=always to --rm for testing
docker run -it \
    --rm \
    --network host \
    --ipc host \
    --env ROS_DOMAIN_ID=${ROS_DOMAIN_ID} \
    --volume="$ROS_PACKAGE_PATH:/home/leo/ros2_ws/src/leorover_orbslam2" \
    --privileged \
    --name leorover_orbslam2 \
    local/leorover_orbslam2:foxy \
    ros2 launch leorover_orbslam2 leo_gz_sim_orbslam2.launch.py