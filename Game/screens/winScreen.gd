extends Node2D

var initial_scene = load("res://screens/titleScreen.tscn")
var game_scene = load("res://screens/game.tscn")


func _ready():
	get_node("/root/Node2D/AnimationPlayer").play("transition_winscene", -1, 1.0, false)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")


func _on_jogarNovamente_pressed():
#warning-ignore:return_value_discarded
	get_tree().change_scene_to(game_scene)


func _on_menuInicial_pressed():
#warning-ignore:return_value_discarded
	get_tree().change_scene_to(initial_scene)


func _on_sair_pressed():
	get_tree().quit()