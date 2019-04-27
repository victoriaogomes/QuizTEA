extends Node2D


func _ready():
	get_node("/root/Node2D/AnimationPlayer").play("transition3", -1, 1.0, false)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_iniciarJogo_pressed():
	pass # Replace with function body.


func _on_goBack_pressed():
	pass # Replace with function body.


func _on_pause_pressed():
	pass # Replace with function body.


func _on_play_pressed():
	pass # Replace with function body.


func _on_stop_pressed():
	pass # Replace with function body.


func _on_goForward_pressed():
	pass # Replace with function body.
