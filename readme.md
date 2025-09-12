# emnv_scene
## Requirement
emnv_ctl_bridge

## 基础Launch文件说明
- gazebo.launch: 打开一个空的gazebo

- single_quad_spawn.launch: 生成一个iris无人机

- single_ctl_bridge.launch: 拉起ctl_bridge和mavros节点

- single.launch: 打开一个iris无人机的gazebo，并拉起tf、ctl_bridge和mavros节点

- multi.launch: 打开多个iris无人机的gazebo，并拉起一个tf节点，多个ctl_bridge和mavros节点