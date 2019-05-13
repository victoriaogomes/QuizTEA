extends Node2D

var next_scene = preload("res://screens/game.tscn")
var previous_scene = load("res://screens/storyChoose.tscn")
var pos = 0
var cena = 1
var seg
var listened_once = 0
var increment
var pause_asset = preload("res://sprites/images/pause.png")
var play_asset = preload("res://sprites/images/play.png")

func _ready():
#warning-ignore:return_value_discarded
	$Timer.connect("timeout", self, "on_TimeOut")
	increment = float(284)/float(157)
	set_process(true)
	# history.volume_db = -20
	$history.stream = load("res://sound/3porquinhos.ogg")
	get_tree().set_auto_accept_quit(false)
	get_tree().set_quit_on_go_back(false)
	get_node("/root/Node2D/AnimationPlayer").play("transition3", -1, 1.0, false)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
	#17 até 301: total de 284 pixels
	#História dos 3 porquinhos: aprx 157s

func _process(delta):
	pos = $history.get_playback_position()
	if(pos<60):
		if(pos<10):
			$timePassing.set_text("00:0" + str(int(pos)))
		else:
			$timePassing.set_text("00:" + str(int(pos)))
	else:
		seg = int(pos)%60
		if(seg<10):
			$timePassing.set_text("0" + str(int(pos/60)) + ":0" + str(seg))
		else:
			$timePassing.set_text("0" + str(int(pos/60)) + ":" + str(seg))


func _on_iniciarJogo_pressed():
	if(listened_once == 1):
		#warning-ignore:return_value_discarded
		get_tree().change_scene_to(next_scene)
	else:
		$Popup.popup()
		$Popup/ok.set_block_signals(false)
		_on_pause_pressed()


func _on_goBack_pressed():
	pass # Replace with function body.


func _on_pause_pressed():
	$play.set_texture(play_asset)
	pos = $history.get_playback_position()
	$history.stop()
	$Timer.stop()


func _on_play_pressed():
	if($play.get_texture() == play_asset):
		print(pos)
		$history.play(pos)
		$Timer.start()
		$play.set_texture(pause_asset)
	else:
		cena = cena + 1
		print("Cena" + str(cena) + ":" + str(pos))
		_on_pause_pressed()


func _on_voltar_pressed():
	get_node("/root/Node2D/AnimationPlayer").play_backwards("transition3", -1)
	yield(get_node("/root/Node2D/AnimationPlayer"), "animation_finished")
	#warning-ignore:return_value_discarded
	get_tree().change_scene_to(previous_scene)


func on_TimeOut():
	$playerExibition.set_size(Vector2(6+(increment*pos),17))


func audioFinished():
	listened_once = 1
	$Timer.stop()
	$play.set_texture(play_asset)
	print(pos)


func _on_ok_pressed():
	$Popup.set_visible(false)
	$Popup/ok.set_block_signals(true)
	_on_play_pressed()