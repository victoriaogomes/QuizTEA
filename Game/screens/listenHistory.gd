extends Node2D

var next_scene = preload("res://screens/game.tscn")
var previous_scene = load("res://screens/storyChoose.tscn")
var instruction_scene = load("res://screens/instructions.tscn")

var titles = [preload("res://sprites/texts/porquinhos.png"), 
preload("res://sprites/texts/chapeuzinho.png"), 
preload("res://sprites/texts/sereia.png")]

var books = [preload("res://sprites/images/3Porquinhos/livro_porquinhos.png"),
preload("res://sprites/images/ChapeuzinhoVermelho/LivroChapeuzinho.png"),
preload("res://sprites/images/PequenaSereia/LivroPequenaSereia.png")]

var musicOff = preload("res://sprites/images/soundOff.png")
var musicOn = preload("res://sprites/images/soundOn.png")

var title_pos = [Vector2(-239.334, -261.787),
Vector2(-191.965, -261.787),
Vector2(-257.229, -261.787)]


func _ready():
	if(global_config.music == true):
		$musicButton.set_texture(musicOn)
	else:
		$musicButton.set_texture(musicOff)
	global_config.level = 0
	$title.set_texture(titles[global_config.storychosen-1])
	$book.set_texture(books[global_config.storychosen-1])
	$title.set_position(title_pos[global_config.storychosen-1])
	get_tree().set_auto_accept_quit(false)
	get_tree().set_quit_on_go_back(false)
	get_node("/root/Node2D/AnimationPlayer").play("transition3", -1, 1.0, false)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")


func _on_iniciarJogo_pressed():
	if($history.listened_once == 1):
		if(global_config.music==true):
			if(global_config.background_sound.is_playing() == false):
				global_config.music_on()
		if(global_config.played_once == 0):
			global_config.comeFrom_listenHistory = 1
			$Popup2.popup()
		else:
			#warning-ignore:return_value_discarded
			get_tree().change_scene_to(next_scene)
	else:
		$Popup.popup()
		$Popup/ok.set_block_signals(false)
		$history._on_pause_pressed()


func _on_voltar_pressed():
	$history.stop()
	get_node("/root/Node2D/AnimationPlayer").play_backwards("transition3", -1)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
	#warning-ignore:return_value_discarded
	get_tree().change_scene_to(previous_scene)


func _on_ok_pressed():
	$Popup.set_visible(false)
	$Popup/ok.set_block_signals(true)
	$history._on_play_pressed()

func _on_okInstrues_pressed():
	get_node("/root/Node2D/AnimationPlayer").play_backwards("transition3", -1)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
	#warning-ignore:return_value_discarded
	get_tree().change_scene_to(instruction_scene)

func _on_musicButton_pressed():
	if(global_config.music == true):
		global_config.music_off()
		$musicButton.set_texture(musicOff)
	else:
		global_config.music_on()
		$musicButton.set_texture(musicOn)
