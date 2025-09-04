# emNavi Scene
Scenes and models resource for PX4 Gazebo SITL.
#添加.bashrc源
## <<< emNavi Scene 放置的工作空间 <<<
source ~/catkin_ws/devel/setup.bash
## px4_stil source
source ~/PX4_Firmware/ ~/PX4_Firmware/build/px4_sitl_default
## 可选：禁用 Fuel 网络下载，避免报错
export GAZEBO_MODEL_DATABASE_URI=""
## 让 ROS 也使用模拟时间
export ROS_USE_SIM_TIME=1
## gazebo的模型和PX4_1.13.2编译gazebo的.so库
export GAZEBO_MODEL_PATH=/home/emnavi/catkin_ws/src/emnv_gazebo_models/models:$GAZEBO_MODEL_PATH
export GAZEBO_PLUGIN_PATH=/home/emnavi/PX4_Firmware/build/px4_sitl_default/build_gazebo:$GAZEBO_PLUGIN_PATH
## 添加PX4的ros工作空间,传感器模型
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/PX4_Firmware
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/catkin_ws/src/emnv_gazebo_models/models

# 暂时文加夹混乱
models文件夹,里面包含了senors和models  
world文件夹繁杂  
emnv_ctl_bridge包的simple_gazebo_swarm.launch,负责启动mavros和ctl_bridge
