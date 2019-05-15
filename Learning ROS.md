# Learning ROS
*An epic journey about a young boy named Frimann who want's to build a robot.*

##### The journey begun on the 6th of may, 2019.


# Installation of ROS

Installed ROS version Melodic to EA2000 Virtual Machine in VirtualBox on Mac. Used the tutuorial on ROS site: http://wiki.ros.org/melodic/Installation/Ubuntu .


## Errors during installation

Running `sudo apt install ros-melodic-desktop-full` gave the following error:

```
E: Failed to fetch http://is.archive.ubuntu.com/ubuntu/pool/universe/b/boost1.65.1/libboost-coroutine1.65.1_1.65.1+dfsg-0ubuntu5_amd64.deb  Undetermined Error [IP: 176.57.227.242 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
```

Solved by changing `Download From` to `Main Server`, in `Software & Updates` in Ubuntu system settings.  

# How to do stuff
## Create environment
```
mkdir -p ~/catkin_ws/src
$ cd ~/catkin_ws/
$ catkin_make
```
# Commands
|Command|Explanation|
|---|---|
|`rosinstall`| ?Install packages?|

# Miscellaneous dots'n'loops

## `rosinstall`

## `catkin`

Catkin is the official build system of ROS and the successor to the original ROS build system, rosbuild. catkin combines CMake macros and Python scripts to provide some functionality on top of CMake's normal workflow. 

What is a Build System?
A build system is responsible for generating 'targets' from raw source code that can be used by an end user. These targets may be in the form of libraries, executable programs, generated scripts, exported interfaces (e.g. C++ header files) or anything else that is not static code. In ROS terminology, source code is organized into 'packages' where each package typically consists of one or more targets when built.