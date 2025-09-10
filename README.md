# emNavi Scene
Scenes and models resource for PX4 Gazebo SITL.  

# 添加工作空间和gazeo_mode模型路径  
source scene_workspace.bash  

# 启动流程   
## 打开emnv_scene的仿真环境  
roslaunch emnv_scene gazebo.launch  
## 运行emnavi_ctl_bridge  
roslaunch emnv_ctl_bridge simple_gazebo_swarm.launch  
##暂未添加PX4的设置文件，可以在QGC内设置本地drone的定位输入源  

# emnv_scene功能包文件目录  
## emnv_scene/world	gazebo的world环境  
## emnv_scene/models	三个文件夹，分别是  
###robot 机器模型	sensors 传感器		other 暂未用上的模型、传感器  

#scene_workspace.bash具体加载的路径  
#添加.bashrc源  
## <<< emNavi Scene 放置的工作空间 <<<  
source ~/catkin_ws/devel/setup.bash  
## px4_stil source  
source ~PX4_Firmware/Tool/setup_gazebo.bash ~/PX4_Firmware ~/PX4_Firmware/build/px4_sitl_default
## 可选：禁用 Fuel 网络下载，避免报错  
export GAZEBO_MODEL_DATABASE_URI=""
## 让 ROS 也使用模拟时间  
export ROS_USE_SIM_TIME=1
## gazebo的模型和PX4_1.13.2编译gazebo的.so库  
export GAZEBO_MODEL_PATH=/home/emnavi/catkin_ws/src/emnv_gazebo_models/models:$GAZEBO_MODEL_PATH
export GAZEBO_MODEL_PATH=/home/emnavi/catkin_ws/src/emnv_gazebo_models/models/X280:$GAZEBO_MODEL_PATH
export GAZEBO_PLUGIN_PATH=/home/emnavi/PX4_Firmware/build/px4_sitl_default/build_gazebo:$GAZEBO_PLUGIN_PATH
## 添加PX4的ros工作空间,传感器模型  
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/PX4_Firmware
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/catkin_ws/src/emnv_gazebo_models/models
