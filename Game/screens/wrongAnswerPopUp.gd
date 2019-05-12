extends Node2D


func _ready():
	pass # Replace with function body.


func _on_ouvirAgain_pressed():
	pass # Replace with function body.


func _on_keepPlaying_pressed():
	$opt1/ouvirAgain.set_block_signals(true)
	$opt2/keepPlaying.set_block_signals(true)
	get_node("/root/Node2D/wrongAnswer/AnimationPlayer").play_backwards("openUp", -1)
	yield(get_node("/root/Node2D/wrongAnswer/AnimationPlayer"), "animation_finished")
	get_node("/root/Node2D/wrongAnswer").set_visible(false)
	#Faz com que seja possível clicar nos botões:
	get_node("/root/Node2D/polaroid3/half1_1").set_block_signals(false)
	get_node("/root/Node2D/polaroid3/half1_2").set_block_signals(false)
	get_node("/root/Node2D/polaroid3_2/half2_1").set_block_signals(false)
	get_node("/root/Node2D/polaroid3_2/half2_2").set_block_signals(false)
