extends Node2D

func _ready():
	pass # Replace with function body.


func _on_play_pressed():
	print("cliquei")
	$option1/play.set_shape_visible(false)
	$instructions.set_shape_visible(false)
	$option3/about.set_shape_visible(false)
	get_node("/root/Node2D/AnimationPlayer").play("transition", -1, 1.0, false)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
	$storySelectScene.set_visible(true)
	get_node("/root/Node2D/storySelectScene/AnimationPlayer").play("transition2", -1, 1.0, false)
	yield(get_node("/root/Node2D/storySelectScene/AnimationPlayer"), "animation_finished")


func _on_instructions_pressed():
	pass # Replace with function body.


func _on_about_pressed():
	pass # Replace with function body.
