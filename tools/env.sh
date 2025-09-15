
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

