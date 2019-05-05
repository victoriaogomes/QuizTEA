extends Node2D

var storyChose_scene = load("res://screens/storyChoose.tscn")


func _ready():
	get_tree().set_quit_on_go_back(true)
	get_tree().set_auto_accept_quit(true)


func _on_play_pressed():
	$option1/play.set_shape_visible(false)
	$instructions.set_shape_visible(false)
	$option3/about.set_shape_visible(false)
	get_node("/root/Node2D/AnimationPlayer").play("transition", -1, 1.0, false)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
#warning-ignore:return_value_discarded
	get_tree().change_scene_to(storyChose_scene)


func _on_instructions_pressed():
	pass # Replace with function body.


func _on_about_pressed():
	pass # Replace with function body.
