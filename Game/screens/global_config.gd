extends Node

var level
var storychosen
var finish
#warning-ignore:unused_class_variable
var zoomPic
var initiatingGame


#Storychosen = 1: 3 porquinhos - level 0 ao 13

func _ready():
	level = 0
	finish = 0
	initiatingGame = 0


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