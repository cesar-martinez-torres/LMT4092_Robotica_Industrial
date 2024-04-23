from robodk.robolink import * 
from robodk.robodialogs import *       # import the robolink library (bridge with RoboDK)
RDK = Robolink() # establish a link with the simulator
robot = RDK.Item('ABB IRB 120-3/0.6')      # retrieve the robot by name
robot.setJoints([165,-62.56,32.46,0,0,0])      # set all robot axes to zero

target = RDK.Item('Target 1')         # retrieve the Target item
robot.MoveJ(target)                 # move the robot to the target

# calculate a new approach position 100 mm along the Z axis of the tool with respect to the target
from robodk.robomath import *       # import the robotics toolbox
approach = target.Pose()*transl(0,0,-100)
robot.MoveL(approach)               # linear move to the approach position

list_items = RDK.ItemList()
for item in list_items:
    print(item.Name()) 
    print("Operation cancelled or no programs available")   
print(target)
RDK.ShowMessage("The relative pose is: ")
ins_call = mbox("Enter a program call to add after each movement", entry="SynchRobot")