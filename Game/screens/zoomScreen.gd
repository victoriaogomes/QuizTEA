extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_close_pressed():
	if(global_config.zoomPic == 0):
		get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play_backwards("zoom_in_Option1", -1)
	else:
		get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play_backwards("zoom_in_Option2", -1)
	yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")