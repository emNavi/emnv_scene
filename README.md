# emNavi Scene
Scenes and models resource for PX4 Gazebo SITL.  

# 启动流程  

## 1)在命令栏中，添加工作空间、gazeo_mode模型路径  
```bash
cd emnv_scene
source scene_workspace.bash  
``` 
## 2)打开emnv_scene的仿真环境  
```bash
roslaunch emnv_scene gazebo.launch  
```
## 3)运行emnavi_ctl_bridge  
```bash
roslaunch emnv_ctl_bridge simple_gazebo_swarm.launch
# 暂未添加PX4的设置文件，可以在QGC内设置本地drone的定位输入源  
```

# emnv_scene功能包文件目录  
```bash
# emnv_scene/world	    gazebo的world环境  

# emnv_scene/models/	模型文件下的三个文件夹：
## /robots              机器模型
## /sensors             传感器		
## /others              暂未用上的模型、传感器  
```