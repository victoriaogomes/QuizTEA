extends Node2D

var next_scene = preload("res://screens/game.tscn")
var previous_scene = load("res://screens/storyChoose.tscn")

var titles = [preload("res://sprites/texts/porquinhos.png"), 
preload("res://sprites/texts/chapeuzinho.png"), 
preload("res://sprites/texts/sereia.png")]

var books = [preload("res://sprites/images/3Porquinhos/livro_porquinhos.png"),
preload("res://sprites/images/3Porquinhos/livro_porquinhos.png"),
preload("res://sprites/images/3Porquinhos/livro_porquinhos.png")]

func _ready():
	get_tree().set_auto_accept_quit(false)
	get_tree().set_quit_on_go_back(false)
	get_node("/root/Node2D/AnimationPlayer").play("transition3", -1, 1.0, false)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
	$title.set_texture(titles[global_config.storychosen-1])
	$book.set_texture(books[global_config.storychosen-1])


func _on_iniciarJogo_pressed():
	if($history.listened_once == 1):
		#warning-ignore:return_value_discarded
		get_tree().change_scene_to(next_scene)
	else:
		$Popup.popup()
		$Popup/ok.set_block_signals(false)
		$history._on_pause_pressed()


func _on_voltar_pressed():
	get_node("/root/Node2D/AnimationPlayer").play_backwards("transition3", -1)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
	#warning-ignore:return_value_discarded
	get_tree().change_scene_to(previous_scene)


func _on_ok_pressed():
	$Popup.set_visible(false)
	$Popup/ok.set_block_signals(true)
	$history._on_play_pressed()