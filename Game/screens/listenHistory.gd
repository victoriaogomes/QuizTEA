extends Node2D

var next_scene = preload("res://screens/game.tscn")

func _ready():
	get_node("/root/Node2D/AnimationPlayer").play("transition3", -1, 1.0, false)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")


func _on_iniciarJogo_pressed():
	get_tree().change_scene_to(next_scene)


func _on_goBack_pressed():
	pass # Replace with function body.


func _on_pause_pressed():
	pass # Replace with function body.


func _on_play_pressed():
	pass # Replace with function body.


func _on_stop_pressed():
	pass # Replace with function body.


func _on_goForward_pressed():
	pass # Replace with function body.
