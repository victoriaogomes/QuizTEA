extends Node2D

var next_scene = preload("res://screens/listenHistory.tscn")


func _ready():
	get_tree().set_auto_accept_quit(false)
	get_tree().set_quit_on_go_back(false)
	get_node("/root/Node2D/AnimationPlayer").play("transition2", -1, 1.0, false)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")


func _on_tresPorquinhos_pressed():
	get_node("/root/Node2D/AnimationPlayer").play_backwards("transition2", -1)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
	_set_buttons_invisible()
	global_config.storychosen = 1
#warning-ignore:return_value_discarded
	get_tree().change_scene_to(next_scene)


func _on_chapeuzinhoVermelho_pressed():
	_set_buttons_invisible()
	global_config.storychosen = 2
#warning-ignore:return_value_discarded
	get_tree().change_scene_to(next_scene)


func _on_pequenaSereia_pressed():
	_set_buttons_invisible()
	global_config.storychosen = 3
#warning-ignore:return_value_discarded
	get_tree().change_scene_to(next_scene)


func _set_buttons_invisible():
	$option1/tresPorquinhos.set_shape_visible(false)
	$option2/pequenaSereia.set_shape_visible(false)
	$chapeuzinhoVermelho.set_shape_visible(false)