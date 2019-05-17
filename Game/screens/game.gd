extends Node2D

var vector
var correctAnswer
var givenAnswer = 3
var pos
var win_scene = preload("res://screens/winScreen.tscn")
#Essas variáveis armazenam o valor "1" caso estejam pressionados e "0" caso não estejam pressionados
var button1_1 = 0
var button1_2 = 0
var button2_1 = 0
var button2_2 = 0


func _ready():
	get_tree().set_auto_accept_quit(false)
	get_tree().set_quit_on_go_back(false)
	if(global_config.storychosen==1):
		vector = [preload("res://sprites/images/3Porquinhos/Parte1.png"), preload("res://sprites/images/3Porquinhos/Parte2.png"),
		preload("res://sprites/images/3Porquinhos/Parte3.png"), preload("res://sprites/images/3Porquinhos/Parte4.png"),
		preload("res://sprites/images/3Porquinhos/Parte5.png"), preload("res://sprites/images/3Porquinhos/Parte6.png"),
		preload("res://sprites/images/3Porquinhos/Parte7.png"), preload("res://sprites/images/3Porquinhos/Parte8.png"),
		preload("res://sprites/images/3Porquinhos/Parte9.png"), preload("res://sprites/images/3Porquinhos/Parte10.png"),
		preload("res://sprites/images/3Porquinhos/Parte11.png"), preload("res://sprites/images/3Porquinhos/Parte12.png"),
		preload("res://sprites/images/3Porquinhos/Parte13.png"), preload("res://sprites/images/3Porquinhos/Parte14.png")]
	elif(global_config.storychosen==2):
		pass
	else:
		pass
	_set_options()


func next():
	if(givenAnswer == correctAnswer):
		global_config.increment_level()
		if(global_config.finish !=1):
			_set_options()
		else:
		#warning-ignore:return_value_discarded
			get_tree().change_scene_to(win_scene)
	else:
		if(givenAnswer == 0):
			get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play_backwards("answer_Option1", -1)
			yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		else:
			get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play_backwards("answer_Option2", -1)
			yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		#sugerir que a história seja ouvida novamente
		#Faz com que não seja possível clicar nos botões:
		$polaroid3/half1_1.set_block_signals(true)
		$polaroid3/half1_2.set_block_signals(true)
		$polaroid3_2/half2_1.set_block_signals(true)
		$polaroid3_2/half2_2.set_block_signals(true)
		$pause.set_block_signals(true)
		$wrongAnswer.set_visible(true)
		$wrongAnswer/opt1/ouvirAgain.set_block_signals(false)
		$wrongAnswer/opt2/keepPlaying.set_block_signals(false)
		get_node("/root/Node2D/wrongAnswer/AnimationPlayer").play("openUp", -1, 1.0, false)
		yield(get_node("/root/Node2D/wrongAnswer/AnimationPlayer"), "animation_finished")


func _set_options():
	correctAnswer = randi()%2
	givenAnswer = 3
	if(global_config.level<12):
		# Sortear um número entre (level+1) e 13:
		pos = (randi()%(13-(global_config.level+1))) + (global_config.level+1)
	else:
		pos = randi()%12
	print("Tamo no level " + str(global_config.level) + "agora")
	match(correctAnswer):
		0: 
			$polaroid3/polaroid1.set_texture(vector[global_config.level])
			$polaroid3_2/polaroid1.set_texture(vector[pos])
		1:
			$polaroid3/polaroid1.set_texture(vector[pos])
			$polaroid3_2/polaroid1.set_texture(vector[global_config.level])


func _zoomScreenAnimation(var type):
	#Faz com que não seja possível clicar nos botões:
	get_node("/root/Node2D/polaroid3/half1_1").set_block_signals(true)
	get_node("/root/Node2D/polaroid3/half1_2").set_block_signals(true)
	get_node("/root/Node2D/polaroid3_2/half2_1").set_block_signals(true)
	get_node("/root/Node2D/polaroid3_2/half2_2").set_block_signals(true)
	if(type == 0):
		$optionsAnimation/TouchScreenButton.set_texture($polaroid3/polaroid1.get_texture())
		$optionsAnimation.set_visible(true)
		$polaroid3/polaroid1.set_shape_visible(false)
		get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play("zoom_in_Option1", -1, 1.0, false)
		yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		global_config.zoomPic = 0
	else:
		$optionsAnimation/TouchScreenButton.set_texture($polaroid3_2/polaroid1.get_texture())
		$optionsAnimation.set_visible(true)
		$polaroid3_2/polaroid1.set_shape_visible(false)
		get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play("zoom_in_Option2", -1, 1.0, false)
		yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		global_config.zoomPic = 1


func _on_half1_1_pressed():
	button1_1 = 1
	_verifyButtonsOption0()


func _on_half1_2_pressed():
	button1_2 = 1
	if(button1_1 != 1):
		_verifyButtonsOption0()


func _on_half2_1_pressed():
	button2_1 = 1
	_verifyButtonsOption1()


func _on_half2_2_pressed():
	button2_2 = 1
	if(button2_1 != 1):
		_verifyButtonsOption1()


func _verifyButtonsOption0():
	yield(get_tree().create_timer(0.2), "timeout")
	if(button1_1 == 1 and button1_2 == 1):
		$optionsAnimation/TouchScreenButton.set_texture($polaroid3/polaroid1.get_texture())
		$optionsAnimation.set_visible(true)
		$polaroid3/polaroid1.set_shape_visible(false)
		get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play("answer_Option1", -1, 1.0, false)
		yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		givenAnswer = 0
		print("Chamando next em option0")
		next()
	else:
		$pauseScreen/close.set_block_signals(true)
		$pause.set_block_signals(true)
		$optionsAnimation/close.set_block_signals(false)
		_zoomScreenAnimation(0)
	button1_1 = 0
	button1_2 = 0


func _verifyButtonsOption1():
	yield(get_tree().create_timer(0.2), "timeout")
	if(button2_1 == 1 and button2_2 == 1):
		$optionsAnimation/TouchScreenButton.set_texture($polaroid3_2/polaroid1.get_texture())
		$optionsAnimation.set_visible(true)
		$polaroid3_2/polaroid1.set_shape_visible(false)
		get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play("answer_Option2", -1, 1.0, false)
		yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		givenAnswer = 1
		print("Chamando next em option1")
		next()
	else:
		$pauseScreen/close.set_block_signals(true)
		$pause.set_block_signals(true)
		$optionsAnimation/close.set_block_signals(false)
		_zoomScreenAnimation(1)
	button2_1 = 0
	button2_2 = 0


func _on_pause_pressed():
	$pauseScreen/close.set_block_signals(false)
	$pause.set_block_signals(true)
	$optionsAnimation/close.set_block_signals(true)
	$pauseScreen.set_visible(true)
	$pauseScreen/AnimationPlayer.play_backwards("Pausemenu", -1)
	yield(get_node("/root/Node2D/pauseScreen/AnimationPlayer"), "animation_finished")