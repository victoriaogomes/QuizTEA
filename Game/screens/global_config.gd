extends Node

var level
var storychosen
var finish
var played_once
#warning-ignore:unused_class_variable
var zoomPic
var initiatingGame
var comeFrom_listenHistory


#Storychosen = 1: 3 porquinhos - level 0 ao 13
#Storychosen = 2: Chapeuzinho Vermelho - level 0 ao 14
#Storychosen = 2: A pequena sereia - level 0 ao 11
func _ready():
	level = 0
	finish = 0
	initiatingGame = 0
	comeFrom_listenHistory = 0
	load_game()


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



#func save_game():
#	var save_game = File.new()
#	save_game.open("res://savegame.save", File.WRITE)
#	var node_data = played_once.call("save")
#	save_game.store_line(to_json(node_data))
#	save_game.close()


#func load_game():
#	var save_game = File.new()
#	if not save_game.file_exists("res://savegame.save"):
#		played_once = 0 # Não tem arquivo pra carregar, então jogo nunca foi jogado
#		return
    # Load the file line by line and process that dictionary to restore
    # the object it represents.
#	save_game.open("res://savegame.save", File.READ)
#	while not save_game.eof_reached():
#		var current_line = parse_json(save_game.get_line())
		# Firstly, we need to create the object and add it to the tree and set its position.
#		played_once = load(current_line["filename"]).instance()
#	save_game.close()