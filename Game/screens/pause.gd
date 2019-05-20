extends Node2D

var initial_scene = load("res://screens/titleScreen.tscn")
var game_scene = load("res://screens/game.tscn")


func _ready():
	get_tree().set_auto_accept_quit(false)
	get_tree().set_quit_on_go_back(false)


func _on_jogarNovamente_pressed():
	global_config.level=0
	global_config.finish=0
	_changeScene(game_scene)


func _on_menuInicial_pressed():
	_changeScene(initial_scene)


func _on_sair_pressed():
	get_tree().quit()


func _changeScene(scene):
	get_node("/root/Node2D/pauseScreen/AnimationPlayer").play("Pausemenu", -1, 1.0, false)
	yield(get_node("/root/Node2D/pauseScreen/AnimationPlayer"), "animation_finished")
#warning-ignore:return_value_discarded
	get_tree().change_scene_to(scene)

func _on_close_pressed():
	get_node("/root/Node2D/polaroid3/half1_1").set_block_signals(false)
	get_node("/root/Node2D/polaroid3/half1_2").set_block_signals(false)
	get_node("/root/Node2D/polaroid3_2/half2_1").set_block_signals(false)
	get_node("/root/Node2D/polaroid3_2/half2_2").set_block_signals(false)
	get_node("/root/Node2D/optionsAnimation").set_visible(false)
	get_node("/root/Node2D/pause").set_block_signals(false)
	get_node("/root/Node2D/pauseScreen/AnimationPlayer").play("Pausemenu", -1, 1.0, false)
	yield(get_node("/root/Node2D/pauseScreen/AnimationPlayer"), "animation_finished")
	get_node("/root/Node2D/pauseScreen").set_visible(false)
	get_node("/root/Node2D/pause").set_block_signals(false)
