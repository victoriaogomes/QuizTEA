extends Node2D

var next_scene = preload("res://screens/listenHistory.tscn")


func _ready():
	pass # Replace with function body.


func _on_tresPorquinhos_pressed():
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