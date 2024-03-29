FROM ros:melodic

SHELL ["/bin/bash", "-c"]

RUN apt-get update &&\ 
    apt-get install -y python3-catkin-tools &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* &&\
    mkdir -p /root/catkin_ws/src &&\
    source /opt/ros/melodic/setup.bash

WORKDIR /root/catkin_ws

RUN catkin config --extend /opt/ros/melodic &&\
    catkin build

CMD [bash]
