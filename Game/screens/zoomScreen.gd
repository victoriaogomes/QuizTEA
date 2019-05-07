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
	#Faz com que seja possível clicar nos botões:
	get_node("/root/Node2D/polaroid3/half1_1").set_block_signals(false)
	get_node("/root/Node2D/polaroid3/half1_2").set_block_signals(false)
	get_node("/root/Node2D/polaroid3_2/half2_1").set_block_signals(false)
	get_node("/root/Node2D/polaroid3_2/half2_2").set_block_signals(false)
	get_node("/root/Node2D/optionsAnimation").set_visible(false)
	get_node("/root/Node2D/pause").set_block_signals(false)