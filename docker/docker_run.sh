#!/bin/bash
# xhost +local:docker

# Note: replace --restart=always to --rm for testing
docker run -it \
    --rm \
    --network host \
    --ipc host \
    --env ROS_DOMAIN_ID=${ROS_DOMAIN_ID} \
    --volume="./leorover_orbslam2:/home/leo/ros2_ws/src/leorover_orbslam2" \
    --name leorover_orbslam2 \
    local/leorover_orbslam2:foxy \
    ros2 launch leorover_orbslam2 leo_gz_sim_orbslam2.launch.py