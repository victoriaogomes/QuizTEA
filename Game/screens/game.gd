extends Node2D

var vector
var correctAnswer
var givenAnswer
var pos

func _ready():
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
	if(givenAnswer == correctAnswer):
		global_config.increment_level()
		$check1.set_visible(false)
		$check2.set_visible(false)
		if(global_config.finish !=1):
			_set_options()
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
			$option1.set_texture(vector[global_config.level])
			$option2.set_texture(vector[pos])
		1:
			$option1.set_texture(vector[pos])
			$option2.set_texture(vector[global_config.level])

func _on_select1_pressed():
	$check1.set_visible(true)
	$check2.set_visible(false)
	givenAnswer = 0


func _on_select2_pressed():
	$check1.set_visible(false)
	$check2.set_visible(true)
	givenAnswer = 1
