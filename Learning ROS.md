# Learning ROS
*An epic journey about a young boy named Frimann who want`s to build a robot.*

The journey begun on the 6th of may, 2019.

# NOTE THIS GUIDE IS OBSOLETE AND HAS MOVED TO DTEs CONFLUENCE PAGE

# ROS can be broken down to:
- Packages
    - contain notes and other data
- Graphs of nodes that communicate using:
    - Topics in the form of **messages** sent from a **publisher** to a **subscriber**
    - Services
    - Parameter server

## Packages 

Packages are a collection of ROS code, like ROS nodes, datasets, libraries etc.

### catkin buildsystem

Catkin is the official build system of ROS and the successor to the original ROS build system, rosbuild. catkin combines CMake macros and Python scripts to provide some functionality on top of CMake`s normal workflow. 

What is a Build System?
A build system is responsible for generating `targets` from raw source code that can be used by an end user. These targets may be in the form of libraries, executable programs, generated scripts, exported interfaces (e.g. C++ header files) or anything else that is not static code. In ROS terminology, source code is organized into `packages` where each package typically consists of one or more targets when built.

The catkin_make command is a convenience tool for working with catkin workspaces. Running it the first time in your workspace, it will create a CMakeLists.txt link in your `src` folder. Additionally, if you look in your current directory you should now have a `build` and `devel` folder. Inside the `devel` folder you can see that there are now several setup.*sh files. Sourcing any of these files will overlay this workspace on top of your environment. To understand more about this see the general catkin documentation: catkin. 

### Building Packages with catkin
catkin packages can be built using the standard cmake workflow, i.e. invoke `cmake <path/to/source space>`, `make`, and then `make install` all from the build space directory. 

### Package status
http://repositories.ros.org/status_page/ros_melodic_default.html

## Quick Overview of Graph Concepts

- **Nodes** A node is an executable that uses ROS to communicate with other nodes.

- **Messages**: ROS data type used when subscribing or publishing to a topic.
- **Topics**: Nodes can publish messages to a topic as well as subscribe to a topic to receive messages.
- **Master**: Name service for ROS (i.e. helps nodes find each other)
- **rosout**: ROS equivalent of stdout/stderr
- **roscore**: Master + rosout + parameter server (parameter server will be introduced later)

## Nodes
A node really isn`t much more than an executable file within a ROS package. ROS nodes use a ROS client library to communicate with other nodes. Nodes can publish or subscribe to a Topic. Nodes can also provide or use a Service.

- roscore = ros+core : master (provides name service for ROS) + rosout (stdout/stderr) + parameter server (parameter server will be introduced later)
- rosnode = ros+node : ROS tool to get information about a node.
- rosrun = ros+run : runs a node from a given package.



## Topics

Topics are named buses over which nodes exchange messages. Topics have anonymous publish/subscribe semantics, which decouples the production of information from its consumption. In general, nodes are not aware of who they are communicating with. Instead, nodes that are interested in data subscribe to the relevant topic; nodes that generate data publish to the relevant topic. There can be multiple publishers and subscribers to a topic.

The `rostopic` tool allows you to get information about ROS **topics**

## Services

Services are another way that nodes can communicate with each other. Services allow nodes to send a request and receive a response.

## Parameter servers

A parameter server is a shared, multi-variate dictionary that is accessible via network APIs. Nodes use this server to store and retrieve parameters at runtime. As it is not designed for high-performance, it is best used for static, non-binary data such as configuration parameters. It is meant to be globally viewable so that tools can easily inspect the configuration state of the system and modify if necessary.

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

 ### Debugging
 For debugging open up the **rqt console** which shows logged error outputs
 ```
 rosrun rqt_console rqt_console
 ```
 
 To set the log level for nodes use the **rqt logger level**
 ```
 rosrun rqt_logger_level rqt_logger_level
```

For viewing the graph use `rqt` or `rqt_graph`

### Setup Catkin tools
See directions here: https://catkin-tools.readthedocs.io/en/latest/quick_start.html

Remember to run `catkin build` and source `env.zsh`.

### Launching ROS scripts
For launching pre-made routines, a set of nodes within namespaces etc, use the **roslaunch** command

```
roslaunch [package] [filename.launch]
```

# Collection of commands
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
`rqt`| RQT main window, for graphs, etc...
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
`rosed [package_name] [filename]` | Directly edit a file within a package
`rospack = ros+pack(age)`| provides information related to ROS packages
`roscd = ros+cd`| changes directory to a ROS package or stack
`rosls = ros+ls`| lists files in a ROS package
`roscp = ros+cp`| copies files from/to a ROS package
`rosmsg = ros+msg`|  provides information related to ROS message definitions
`rossrv = ros+srv`| provides information related to ROS service definitions
`catkin_make`| makes (compiles) a ROS package


# Info regarding EA1000 ROS WS

Uses `catkin tools`, not `catkin make`. 

All the packages are set to depend on ROS' `rospy` package. That means that all the packages are configured to autogenerate Python code. If we were using C++ we would instead use `roscpp` which is for C++.

The next step to configure each package is to edit the `setup.py` and `CMakeLists.txt` files in each package. `setup.py` tells ROS where your Python import path is located.

## Folder structure within the EA1000 ROS Workspace
Moves to Confluence https://dtequipment.atlassian.net/wiki/spaces/EA1/pages/3866629/EA1000+Code+Documentation
```
├── docs 
├── env.sh
├── env.zsh
├── LICENSE.md
├── README.md
└── src
    ├── <device_type>
    │   ├── CMakeLists.txt
    │   ├── package.xml
    │   ├── setup.py
    │   └── src
    │       ├── <device_type>_node.py
    │       └── <device_type>_pkg
    │           ├── <device>
    │           │   ├── <device>>
    │           │   │   ├── <device>.py
    │           │   │   ├── helpers.py
    │           │   │   └── __init__.py
    │           │   ├── __init__.py
    │           │   ├── LICENSE.md
    │           │   ├── README.md
    │           │   └── tests
    │           │       ├── <device>
    │           │       │   └── test_<device>.py
    │           │       └── __init__.py
    │           └── __init__.py
    └── <other ROS package>
        ├── CMakeLists.txt
        └── package.xml
```




