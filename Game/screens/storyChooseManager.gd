extends Node2D

var next_scene = preload("res://screens/listenHistory.tscn")
var game_scene = preload("res://screens/game.tscn")
var previous_scene = load("res://screens/titleScreen.tscn")
var musicOff = preload("res://sprites/images/soundOff.png")
var musicOn = preload("res://sprites/images/soundOn.png")

var modoFacil = preload("res://sprites/texts/ModoFacil.png")
var modoDificil = preload("res://sprites/texts/ModoDificil.png")

var pequenaSereia = preload("res://sprites/texts/sereia.png")
var tresPorquinhos = preload("res://sprites/texts/porquinhos.png")


func _ready():
	get_tree().set_auto_accept_quit(false)
	get_tree().set_quit_on_go_back(false)
	if(global_config.music == true):
		$musicButton.set_texture(musicOn)
	else:
		$musicButton.set_texture(musicOff)
	get_node("/root/Node2D/AnimationPlayer").play("transition2", -1, 1.0, false)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")


func _on_tresPorquinhos_pressed():
	if($option1/tresPorquinhos2.get_texture() == tresPorquinhos):
		global_config.storychosen = 1
		get_node("/root/Node2D/AnimationPlayer").play("transition", -1, 1.0, false)
		yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
	elif($option1/tresPorquinhos2.get_texture() == modoFacil):
		global_config.easymode = 1
		get_node("/root/Node2D/AnimationPlayer").play("transition3", -1, 1.0, false)
		yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
		_set_buttons_invisible()
		#warning-ignore:return_value_discarded
		get_tree().change_scene_to(game_scene)


func _on_chapeuzinhoVermelho_pressed():
	global_config.storychosen = 2
	get_node("/root/Node2D/AnimationPlayer").play("transition", -1, 1.0, false)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")


func _on_pequenaSereia_pressed():
	if($option2/pequenaSereia2.get_texture() == pequenaSereia):
		global_config.storychosen = 3
		get_node("/root/Node2D/AnimationPlayer").play("transition", -1, 1.0, false)
		yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
	elif($option2/pequenaSereia2.get_texture() == modoDificil):
		global_config.easymode = 0
		get_node("/root/Node2D/AnimationPlayer").play("transition3", -1, 1.0, false)
		yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
		_set_buttons_invisible()
		#warning-ignore:return_value_discarded
		get_tree().change_scene_to(next_scene)


func _set_buttons_invisible():
	$option1/tresPorquinhos.set_shape_visible(false)
	$option2/pequenaSereia.set_shape_visible(false)
	$chapeuzinhoVermelho.set_shape_visible(false)


func _on_voltar_pressed():
	if($option1/tresPorquinhos2.get_texture() == modoFacil):
		get_node("/root/Node2D/AnimationPlayer").play_backwards("transition", -1)
		yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
	else:
		get_node("/root/Node2D/AnimationPlayer").play_backwards("transition2", -1)
		yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
		#warning-ignore:return_value_discarded
		get_tree().change_scene_to(previous_scene)


func _on_musicButton_pressed():
	if(global_config.music == true):
		global_config.music_off()
		$musicButton.set_texture(musicOff)
	else:
		global_config.music_on()
		$musicButton.set_texture(musicOn)