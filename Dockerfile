FROM ros:melodic

SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install -y \
    python3-catkin-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /root/catkin_ws/src/sample_ros_cicd \
    && source /opt/ros/melodic/setup.bash
COPY src/* /root/catkin_ws/sample_ros_cicd/src/
COPY include/* /root/catkin_ws/sample_ros_cicd/include/
COPY package.xml /root/catkin_ws/src/sample_ros_cicd/
COPY CMakeLists.txt /root/catkin_ws/src/sample_ros_cicd/ 
WORKDIR /root/catkin_ws
RUN catkin config --extend /opt/ros/melodic &&\
    catkin build
CMD [bash]
