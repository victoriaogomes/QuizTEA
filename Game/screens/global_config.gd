extends Node

var level
var storychosen
var finish
var played_once
#warning-ignore:unused_class_variable
var zoomPic
var initiatingGame
var background_sound = AudioStreamPlayer.new()
var comeFrom_listenHistory
var music = true
#Caso easymode = 1, Modo de jogo fácil está ativado
#Caso easymode = 0, Modo de jogo difícil está ativado
var easymode
signal musicChanged


#Storychosen = 1: 3 porquinhos - level 0 ao 13
#Storychosen = 2: Chapeuzinho Vermelho - level 0 ao 14
#Storychosen = 2: A pequena sereia - level 0 ao 11
func _ready():
	level = 0
	finish = 0
	initiatingGame = 0
	comeFrom_listenHistory = 0
	load_game()
	playSong()
	music_on()


func increment_level():
	level = level+1
	if(storychosen==1):
		if(level == 14):
			finish = 1
	elif(storychosen==2):
		if(level == 15):
			finish = 1
	else:
		if(level == 12):
			finish = 1

#Função para salvar os dados do jogo
func save_game():
	var arquivo = File.new()
	var erro = arquivo.open("user://save.data", File.WRITE)
	if not erro:
		arquivo.store_var(played_once)
	else:
		print("Erro ao salvar dados")
	arquivo.close()


#Função para carregar os dados do jogo
func load_game():
	var arquivo = File.new()
	var erro = arquivo.open("user://save.data", File.READ)
	if not erro:
		var dadosSalvos = arquivo.get_var()
		played_once = dadosSalvos
	else:
		played_once = 0
		print("Erro ao carregar dados")
	arquivo.close()

#Liga a música do jogo
func music_on():
	music = true
	background_sound.play()
	emit_signal("musicChanged")


#Desliga a música do jogo
func music_off():
	music = false
	background_sound.stop()
	emit_signal("musicChanged")


#Função que seta as configurações da música que deve ser tocada na abertura do jogo
func playSong():
	self.add_child(background_sound)
	background_sound.stream = load("res://sound/Ukulele_Beach.ogg")
	background_sound.volume_db = -20
