extends Node

var level
var storychosen
var finish
var zoomPic

#Storychosen = 1: 3 porquinhos - vai do level 0 ao 13

# Called when the node enters the scene tree for the first time.
func _ready():
	level = 0
	finish = 0

func increment_level():
	level = level+1
	if(storychosen==1):
		if(level == 14):
			finish = 1
	elif(storychosen==2):
		if(level == 10):
			finish = 1
	else:
		if(level == 11):
			finish = 1


