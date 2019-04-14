extends Node2D

func _ready():
	pass # Replace with function body.


func _on_play_pressed():
	$option1/play.set_pickable(false)
	$instructions.set_pickable(false)
	$option3/about.set_pickable(false)
	$storySelectScene.set_visible(true)


func _on_instructions_pressed():
	pass # Replace with function body.


func _on_about_pressed():
	pass # Replace with function body.
