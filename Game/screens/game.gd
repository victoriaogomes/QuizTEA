extends Node2D

var vector
var correctAnswer
var givenAnswer
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


func _on_next_pressed():
	print("uhu")
	if(givenAnswer == correctAnswer):
		global_config.increment_level()
		$check1.set_visible(false)
		$check2.set_visible(false)
		if(global_config.finish !=1):
			_set_options()
		else:
		#warning-ignore:return_value_discarded
			get_tree().change_scene_to(win_scene)
	elif(givenAnswer == 3):
		pass #Mandar selecionar uma opção
	else:
		$check1.set_visible(false)
		$check2.set_visible(false)
		#sugerir que a história seja ouvida novamente


func _set_options():
	correctAnswer = randi()%2
	givenAnswer = 3
	if(global_config.level<12):
		# Sortear um número entre (level+1) e 13:
		pos = (randi()%(13-(global_config.level+1))) + (global_config.level+1)
	else:
		pos = randi()%12
	match(correctAnswer):
		0: 
			$polaroid3/polaroid1.set_texture(vector[global_config.level])
			$polaroid3_2/polaroid1.set_texture(vector[pos])
		1:
			$polaroid3/polaroid1.set_texture(vector[pos])
			$polaroid3_2/polaroid1.set_texture(vector[global_config.level])


func _zoomScreenAnimation(var type):
	if(!$optionsAnimation.is_visible_in_tree()):
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
			$polaroid3/polaroid1.set_shape_visible(false)
			get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play("zoom_in_Option2", -1, 1.0, false)
			yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
			global_config.zoomPic = 1


func _on_half1_1_pressed():
	button1_1 = 1
	print("apertei 1_1")
	_verifyButtonsOption0()
func _on_half1_1_released():
	button1_1 = 0
	print("soltei 1_1")


func _on_half1_2_pressed():
	button1_2 = 1
	print("apertei 1_2")
	_verifyButtonsOption0()
func _on_half1_2_released():
	button1_2 = 0
	print("soltei 1_2")


func _on_half2_1_pressed():
	button2_1 = 1
	print("apertei 2_1")
	_verifyButtonsOption1()
func _on_half2_1_released():
	button2_1 = 0
	print("soltei 2_1")


func _on_half2_2_pressed():
	button2_2 = 1
	_verifyButtonsOption1()
	print("apertei 2_2")
func _on_half2_2_released():
	button2_2 = 0
	print("soltei 2_2")


func _verifyButtonsOption0():
	print("toaquiii")
	if(button1_1 == 1 and button1_2 == 1):
		print("entrei aqui no resposta")
		$optionsAnimation/TouchScreenButton.set_texture($polaroid3/polaroid1.get_texture())
		$optionsAnimation.set_visible(true)
		$polaroid3/polaroid1.set_shape_visible(false)
		get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play("answer_Option1", -1, 1.0, false)
		yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		givenAnswer = 0
		_set_options()
	else:
		print("entrei aqui no zoom")
		_zoomScreenAnimation(0)


func _verifyButtonsOption1():
	if(button2_1 == 1 and button2_2 == 1):
		$optionsAnimation/TouchScreenButton.set_texture($polaroid3_2/polaroid1.get_texture())
		$optionsAnimation.set_visible(true)
		$polaroid3_2/polaroid1.set_shape_visible(false)
		get_node("/root/Node2D/optionsAnimation/AnimationPlayer").play("answer_Option2", -1, 1.0, false)
		yield(get_node("/root/Node2D/optionsAnimation/AnimationPlayer"), "animation_finished")
		givenAnswer = 1
		_set_options()
	else:
		_zoomScreenAnimation(1)