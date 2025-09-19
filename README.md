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

# emnv_scene/urdf_models 导入的urdf模型文件

# emnv_scene/models/	模型文件下的三个文件夹：
## /robots              机器模型
## /sensors             传感器		
## /others              暂未用上的模型、传感器 
## /world_moldes        .world的环境模型
```

# 新增TJU(TJ university)的forest场景下的仿真环境
```bash
roslaunch emnv_scene gazebo_forest_TJU.launch
# 务必编译emnv_scene,5个墙壁模型,通过urdf文件链接.
# 若不编译,无法正常加载和使用该world场景

# 该场景尺寸,13*7*7m

# 榕树2.8高×2 宽    10棵
# 松树2高×1宽     5棵

# 假墙: 3×3米的  三个;    3×2米  二个;

# 更新.world,并替换源有的场景时,请不要加载飞机!
```

# 新增TJU(TJ university)的tunnel场景下的仿真环境
```bash
roslaunch emnv_scene tunnel_TJU.launch
# 务必编译emnv_scene,隧道的模型文件,通过urdf文件链接.
# 若不编译,无法正常加载和使用该world场景

# 该场景尺寸,6.5*13+2.2*7.8+3.0*7m

# 内部矿洞，直径2m，直径2m的半圆+2*2的矩形矿洞。

# 图片pictures/tunnel_simulation

# 更新.world,并替换源有的场景时,请不要加载飞机!
```

/home/emnavi/catkin_ws/
/home/emnavi/X280_SIM/
