extends Node2D

var next_scene = preload("res://screens/game.tscn")
var previous_scene = load("res://screens/storyChoose.tscn")

func _ready():
	get_tree().set_auto_accept_quit(false)
	get_tree().set_quit_on_go_back(false)
	get_node("/root/Node2D/AnimationPlayer").play("transition3", -1, 1.0, false)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")


func _on_iniciarJogo_pressed():
#warning-ignore:return_value_discarded
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


func _on_voltar_pressed():
#warning-ignore:return_value_discarded
	get_tree().change_scene_to(previous_scene)
	get_node("/root/Node2D/AnimationPlayer").play_backwards("transition3", -1)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
