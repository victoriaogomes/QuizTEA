extends AudioStreamPlayer

var pause_asset = preload("res://sprites/images/pause.png")
var play_asset = preload("res://sprites/images/play.png")
var increment
var pos = 0
var seg
var cena = 1
var listened_once = 0


func _ready():
	#warning-ignore:return_value_discarded
	$Timer.connect("timeout", self, "on_TimeOut")
	set_process(true)
	# history.volume_db = -20
	#17 até 301: total de 284 pixels
	match(global_config.storychosen):
		1:
			self.stream = load("res://sound/3porquinhos.ogg")
			increment = float(284)/float(99.85)
		2:
			self.stream = load("res://sound/ChapeuzinhoVermelho.ogg")
			increment = float(284)/float(117.47)
		3:
			self.stream = load("res://sound/PequenaSereia.ogg")
			increment = float(284)/float(99.50)


#warning-ignore:unused_argument
func _process(delta):
	pos = self.get_playback_position()
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


func _on_goBack_pressed():
	if(self.get_playback_position()>5):
		self.play(self.get_playback_position() - 5)
	else:
		self.play(0)
	$play.set_texture(pause_asset)


func _on_pause_pressed():
	$play.set_texture(play_asset)
	pos = self.get_playback_position()
	self.stop()
	$Timer.stop()


func _on_play_pressed():
	if($play.get_texture() == play_asset):
		print(pos)
		self.play(pos)
		$Timer.start()
		$play.set_texture(pause_asset)
	else:
		cena = cena + 1
		print("Cena" + str(cena) + ":" + str(pos))
		_on_pause_pressed()


func on_TimeOut():
	$playerExibition.set_size(Vector2(6+(increment*pos),17))


func audioFinished():
	listened_once = 1
	$Timer.stop()
	$play.set_texture(play_asset)
	print(pos)


func setAudioTime(var time):
	self.play(time)
	$Timer.start()
	$play.set_texture(pause_asset)


func _on_goForward_pressed():
	if(self.get_playback_position()<151):
		self.play(self.get_playback_position() + 5)
	else:
		self.play(156)
	$play.set_texture(pause_asset)


func _on_keepPlaying_pressed():
	get_node("/root/Node2D/Popup").set_visible(false)
	$goBack.set_shape_visible(false)
	$goBack.set_visible(false)
	$goForward.set_shape_visible(false)
	$goForward.set_visible(false)
	$play.set_shape_visible(false)
	$play.set_visible(false)
	$timePassing.set_visible(false)
	$playerExibition.set_visible(false)
	$keepPlaying.set_shape_visible(false)
	$keepPlaying.set_visible(false)
	self.stop()
	$goBack.set_block_signals(true)
	$play.set_block_signals(true)
	$goForward.set_block_signals(true)
	$keepPlaying.set_block_signals(true)
	get_node("/root/Node2D/polaroid3/half1_1").set_block_signals(false)
	get_node("/root/Node2D/polaroid3/half1_2").set_block_signals(false)
	get_node("/root/Node2D/polaroid3_2/half2_1").set_block_signals(false)
	get_node("/root/Node2D/polaroid3_2/half2_2").set_block_signals(false)
	get_node("/root/Node2D/pause").set_block_signals(false)