extends Node2D

var scenesTimes = [0, 12.725333, 30.613333, 37.653332, 44.234665, 55.152, 71.429337, 78.496002,
85.008003, 99.823997, 118.037331, 128.325333, 140.223999, 148.725327]

func _ready():
	pass # Replace with function body.


func _on_ouvirAgain_pressed():
	get_node("/root/Node2D/wrongAnswer/AnimationPlayer").play_backwards("openUp", -1)
	yield(get_node("/root/Node2D/wrongAnswer/AnimationPlayer"), "animation_finished")
	get_node("/root/Node2D/wrongAnswer").set_visible(false)
	get_node("/root/Node2D/Popup").popup()
	get_node("/root/Node2D/Popup/history/goBack").set_visible(true)
	get_node("/root/Node2D/Popup/history/play").set_visible(true)
	get_node("/root/Node2D/Popup/history/goForward").set_visible(true)
	get_node("/root/Node2D/Popup/history/timePassing").set_visible(true)
	get_node("/root/Node2D/Popup/history/playerExibition").set_visible(true)
	get_node("/root/Node2D/Popup/history/keepPlaying").set_visible(true)
	
	get_node("/root/Node2D/Popup/history/goBack").set_block_signals(false)
	get_node("/root/Node2D/Popup/history/play").set_block_signals(false)
	get_node("/root/Node2D/Popup/history/goForward").set_block_signals(false)
	get_node("/root/Node2D/Popup/history/keepPlaying").set_block_signals(false)
	
	get_node("/root/Node2D/Popup/history").setAudioTime(scenesTimes[global_config.level])


func _on_keepPlaying_pressed():
	$opt1/ouvirAgain.set_block_signals(true)
	$opt2/keepPlaying.set_block_signals(true)
	get_node("/root/Node2D/wrongAnswer/AnimationPlayer").play_backwards("openUp", -1)
	yield(get_node("/root/Node2D/wrongAnswer/AnimationPlayer"), "animation_finished")
	get_node("/root/Node2D/wrongAnswer").set_visible(false)
	#Faz com que seja possível clicar nos botões:
	get_node("/root/Node2D/polaroid3/half1_1").set_block_signals(false)
	get_node("/root/Node2D/polaroid3/half1_2").set_block_signals(false)
	get_node("/root/Node2D/polaroid3_2/half2_1").set_block_signals(false)
	get_node("/root/Node2D/polaroid3_2/half2_2").set_block_signals(false)
	get_node("/root/Node2D/pause").set_block_signals(false)
