#!/bin/bash
# 添加工作路径
# emnavi_scene
EMNAVI_SCENE_WS=~/catkin_ws
SCENE_MODEL_DIR=$EMNAVI_SCENE_WS/src/emnv_scene/models
# PX4
PX4_DIR=~/PX4_Firmware
PX4_BUILD_DIR=$PX4_DIR/build/px4_sitl_default
# source_scene_gazebo.bash
# 用于添加 PX4 + Gazebo 环境
source /opt/ros/noetic/setup.bash
source $EMNAVI_SCENE_WS/devel/setup.bash

# Gazebo 模型路径
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$SCENE_MODEL_DIR/robots:$SCENE_MODEL_DIR/sensors:$SCENE_MODEL_DIR/others

# Gazebo 插件路径
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:$PX4_BUILD_DIR/build_gazebo

# ROS 包路径
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$PX4_DIR

# PX4 Gazebo 环境
source $PX4_DIR/Tools/setup_gazebo.bash $PX4_DIR $PX4_BUILD_DIR

# 禁用 Fuel 网络下载，避免报错
export GAZEBO_MODEL_DATABASE_URI=""
# 让 ROS 也使用模拟时间
export ROS_USE_SIM_TIME=1

# 验证PX4已加载到工作空间
# rospack find px4
# 提示/home/emnavi/PX4_Firmware

# roslaunch emnv_ctl_bridge simple_gazebo_swarm.launch
# roslaunch emnv_scene gazebo.launch