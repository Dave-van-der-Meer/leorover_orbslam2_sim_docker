import os
from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory


def generate_launch_description():

    use_sim_time = LaunchConfiguration('use_sim_time')
    params_file = LaunchConfiguration('params_file')
    voc_file = LaunchConfiguration('voc_file')

    remappings = [
        ('/camera/image_raw', '/leo04/camera/image_raw'),
        ('/camera/camera_info', '/leo04/camera/camera_info'),
    ]

    return LaunchDescription([
        DeclareLaunchArgument(
            'use_sim_time',
            default_value='false',
            description='Use simulation (Gazebo) clock if true'),

        DeclareLaunchArgument(
            'params_file',
            default_value=os.path.join(
                get_package_share_directory("leorover_orbslam2"),
                'ros', 'config', 'params_leo_mono.yaml'),
            description='Full path to the ROS2 parameters file to use for all launched nodes'),

        DeclareLaunchArgument(
            'voc_file',
            default_value=os.path.join(
                get_package_share_directory("orb_slam2_ros"),
                'orb_slam2', 'Vocabulary', 'ORBvoc.txt'),
            description='Full path to vocabulary file to use'),

        Node(
            parameters=[
              params_file,
              {"voc_file": voc_file,
               "use_sim_time": use_sim_time},
            ],
            package='orb_slam2_ros',
            executable='orb_slam2_ros_mono',
            name='orb_slam2_mono',
            output='screen',
            remappings=remappings
        )
    ])
