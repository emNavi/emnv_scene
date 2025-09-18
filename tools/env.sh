
if [ -z "$ROS_WORKSPACE" ]; then
    # 如果未设置，则设置默认值 ~/catkin_ws/
    export ROS_WORKSPACE=~/catkin_ws/
    echo "ROS_WORKSPACE is not set, set it to: $ROS_WORKSPACE"
else
    # 如果已设置，输出当前值
    echo "ROS_WORKSPACE is: $ROS_WORKSPACE"
fi

if [ -z "$PX4_HOME" ]; then
    echo -e "\e[31mPX4_HOME is not set. Please set PX4_HOME to your PX4-Autopilot directory.\e[0m"
    # exit 1
else
    if [ -z "$GAZEBO_PLUGIN_PATH" ]; then
        source $PX4_HOME/Tools/simulation/gazebo-classic/setup_gazebo.bash $PX4_HOME $PX4_HOME/build/px4_sitl_default
    else
        echo -e "\e[32mGAZEBO_PLUGIN_PATH is already set. Skipping Gazebo setup.\e[0m"
    fi
    export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$PX4_HOME
    export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$PX4_HOME/Tools/simulation/gazebo-classic/sitl_gazebo-classic
fi

# 添加 ROS_WORKSPACE/devel/lib 到 GAZEBO_PLUGIN_PATH
if [ -z "$GAZEBO_PLUGIN_PATH" ]; then
    export GAZEBO_PLUGIN_PATH=${ROS_WORKSPACE}/devel/lib
    echo "GAZEBO_PLUGIN_PATH is not set, set it to: $GAZEBO_PLUGIN_PATH"
else
    if ! echo "$GAZEBO_PLUGIN_PATH" | grep -q "${ROS_WORKSPACE}/devel/lib"; then
        export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:${ROS_WORKSPACE}/devel/lib
        echo "Added ${ROS_WORKSPACE}/devel/lib to GAZEBO_PLUGIN_PATH"
    else
        echo -e "\e[32m${ROS_WORKSPACE}/devel/lib already exists in GAZEBO_PLUGIN_PATH.\e[0m"
    fi
fi

# 获取emnv_scene的路径
EMNV_SCENE_PATH=${ROS_WORKSPACE}/src/emnv_scene

# 定义一个数组，包含所有要添加的模型路径
MODEL_PATHS=(
    ${EMNV_SCENE_PATH}/models/robots
    ${EMNV_SCENE_PATH}/models/others
    ${EMNV_SCENE_PATH}/models/sensors
    # ......
)

# 检查 GAZEBO_MODEL_PATH 是否已设置
if [ -z "$GAZEBO_MODEL_PATH" ]; then
    # 如果未设置，则初始化为所有模型路径的组合
    export GAZEBO_MODEL_PATH=$(IFS=:; echo "${MODEL_PATHS[*]}")
    echo "GAZEBO_MODEL_PATH is not set, set it to: $GAZEBO_MODEL_PATH"
else
    # 如果已设置，则逐个检查并添加路径
    for MODEL_PATH in "${MODEL_PATHS[@]}"; do
        if ! echo "$GAZEBO_MODEL_PATH" | grep -q "$MODEL_PATH"; then
            export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:${MODEL_PATH}
            echo "Added $MODEL_PATH to GAZEBO_MODEL_PATH"
        else
            echo -e "\e[32m$MODEL_PATH already exists in GAZEBO_MODEL_PATH.\e[0m"
        fi
    done
fi