# Learning ROS
*An epic journey about a young boy named Frimann who want's to build a robot.*

The journey begun on the 6th of may, 2019.


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
### Overlay workspace 
```
source devel/setup.bash
```
 
 ### Check if overlayed
 ```
 echo $ROS_PACKAGE_PATH
 ```

# Commands
|Command|Explanation|
|---|---|
|`rosinstall`|  a frequently used command-line tool that enables you to easily download many source trees for ROS packages with one command|
`rospack find [package name]`| Find package path
`roscd [package name[\subdir]]` | Change dir to package path 
 `roscd log` | go to log dir
`roscd [package name]`| Change dir to package path
`catkin_create_pkg <package_name> [depend1] [depend2] [depend3]`| Create catkin package, run in src dir
`rospack depends <package name>`| show all dependencies
`rospack depends1 <package name>`| show level 1 dependencies
`apt search ros-melodic` | Search available packages    
`rosnode list` | List the nodes in currently running `roscore` server
`rosnode info <node_name>`|Show info about ROS node
`rosrun turtlesim turtlsim_node`| Clean up lost processes (Nodes)
`rosrun [package_name] [node_name]`| Run a ROS node, f.x. `rosrun turtlesim turtlesim_node`
`roscore` | Run a ROS server
`rosrun rqt_graph rqt_graph` | Display topics in a graph
`rostpic`| Get information about ROS **topics**
`rostopic list -v` | Display a verbose list of topics
`rostopic echo <topic>`| Listen to a topic stream
`rostopic type <topic>`| Show type of topic
`rosmsg show <topic type>` | Description of type
`rosmsg show <topic>` | Description of the type of a given topic
`rostopic pub [topic] [msg_type] [args]` | Publish a message to a topic
`rostopic pub -l [topic] [msg_type] [args]` | Send one message
`rostopic pub [topic] [msg_type] -r 1 [args]` | Send a repeated message at 1Hz
`rostopic hz [topic]` | Display the rate at which data is published
`rostopic type <topic> | rosmsg show`| Get type information about a topic
`rosrun rqt_plot rqt_plot`|Live plot of topics
`rosservice list` | List of all services
`rosservice type <service>` | Shows service argument type
`rosservice type <service> | rossrv show` | Show service type info
`rosservice call <service> <argument>` | Send a message to a service
`rosparam <command>` | set, get, load, dump, delete and list parameters
`rosparam list` | List all parameters
`rosparam get /`| Get all parameters on the parm server



# Miscellaneous stuff

## catkin

Catkin is the official build system of ROS and the successor to the original ROS build system, rosbuild. catkin combines CMake macros and Python scripts to provide some functionality on top of CMake's normal workflow. 

What is a Build System?
A build system is responsible for generating 'targets' from raw source code that can be used by an end user. These targets may be in the form of libraries, executable programs, generated scripts, exported interfaces (e.g. C++ header files) or anything else that is not static code. In ROS terminology, source code is organized into 'packages' where each package typically consists of one or more targets when built.

The catkin_make command is a convenience tool for working with catkin workspaces. Running it the first time in your workspace, it will create a CMakeLists.txt link in your 'src' folder. Additionally, if you look in your current directory you should now have a 'build' and 'devel' folder. Inside the 'devel' folder you can see that there are now several setup.*sh files. Sourcing any of these files will overlay this workspace on top of your environment. To understand more about this see the general catkin documentation: catkin. 

## Building Packages with catkin
catkin packages can be built using the standard cmake workflow, i.e. invoke 'cmake <path/to/source space>', 'make', and then 'make install' all from the build space directory. 

## Package status
http://repositories.ros.org/status_page/ros_melodic_default.html

## Nodes
A node really isn't much more than an executable file within a ROS package. ROS nodes use a ROS client library to communicate with other nodes. Nodes can publish or subscribe to a Topic. Nodes can also provide or use a Service.

- roscore = ros+core : master (provides name service for ROS) + rosout (stdout/stderr) + parameter server (parameter server will be introduced later)
- rosnode = ros+node : ROS tool to get information about a node.
- rosrun = ros+run : runs a node from a given package.


# Quick Overview of Graph Concepts

- **Nodes** A node is an executable that uses ROS to communicate with other nodes.

- **Messages**: ROS data type used when subscribing or publishing to a topic.
- **Topics**: Nodes can publish messages to a topic as well as subscribe to a topic to receive messages.
- **Master**: Name service for ROS (i.e. helps nodes find each other)
- **rosout**: ROS equivalent of stdout/stderr
- **roscore**: Master + rosout + parameter server (parameter server will be introduced later)

# Topics

The `rostopic` tool allows you to get information about ROS **topics**

# Services

Services are another way that nodes can communicate with each other. Services allow nodes to send a request and receive a response.

# Parameters

A parameter server is a shared, multi-variate dictionary that is accessible via network APIs. Nodes use this server to store and retrieve parameters at runtime. As it is not designed for high-performance, it is best used for static, non-binary data such as configuration parameters. It is meant to be globally viewable so that tools can easily inspect the configuration state of the system and modify if necessary.