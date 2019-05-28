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
	#8 até 335: total de 327 pixels
	global_config.connect("musicChanged", self, "changeBackSound")
	match(global_config.storychosen):
		1:
			if(global_config.music == true):
				self.stream = load("res://sound/3porquinhos.ogg")
			else:
				self.stream = load("res://sound/3porquinhos_01.ogg")
			increment = float(327)/float(99.85)
		2:
			if(global_config.music == true):
				self.stream = load("res://sound/ChapeuzinhoVermelho.ogg")
			else:
				self.stream = load("res://sound/ChapeuzinhoVermelho_01.ogg")
			increment = float(327)/float(117.47)
		3:
			if(global_config.music == true):
				self.stream = load("res://sound/PequenaSereia.ogg")
			else:
				self.stream = load("res://sound/PequenaSereia_01.ogg")
			increment = float(327)/float(99.50)


func changeBackSound():
	var position
	var isPlaying
	position = self.get_playback_position()
	isPlaying = self.is_playing()
	match(global_config.storychosen):
		1:
			if(global_config.music == true):
				self.stream = load("res://sound/3porquinhos.ogg")
			else:
				self.stream = load("res://sound/3porquinhos_01.ogg")
		2:
			if(global_config.music == true):
				self.stream = load("res://sound/ChapeuzinhoVermelho.ogg")
			else:
				self.stream = load("res://sound/ChapeuzinhoVermelho_01.ogg")
		3:
			if(global_config.music == true):
				self.stream = load("res://sound/PequenaSereia.ogg")
			else:
				self.stream = load("res://sound/PequenaSereia_01.ogg")
	if(isPlaying):
		self.play(position)
		global_config.background_sound.stop()
	else:
		self.seek(position)


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
	if(global_config.music == true):
		global_config.music_on()
	$Timer.stop()


func _on_play_pressed():
	global_config.background_sound.stop()
	if($play.get_texture() == play_asset):
		self.play(pos)
		$Timer.start()
		$play.set_texture(pause_asset)
	else:
		cena = cena + 1
		_on_pause_pressed()


func on_TimeOut():
	$playerExibition.set_size(Vector2(6+(increment*pos),17))


func audioFinished():
	listened_once = 1
	if(global_config.music==true):
		global_config.music_on()
	$Timer.stop()
	$play.set_texture(play_asset)


func setAudioTime(var time):
	self.play(time)
	global_config.background_sound.stop()
	$Timer.start()
	$play.set_texture(pause_asset)


func _on_goForward_pressed():
	if(self.get_playback_position()<151):
		self.play(self.get_playback_position() + 5)
	else:
		self.play(156)
	$play.set_texture(pause_asset)


func _on_keepPlaying_pressed():
	if(global_config.music==true):
		global_config.music_on()
	$goBack.set_block_signals(true)
	$play.set_block_signals(true)
	$goForward.set_block_signals(true)
	$keepPlaying.set_block_signals(true)
	$goBack.set_texture(null)
	$goForward.set_texture(null)
	$play.set_texture(null)
	$timePassing.set_visible(false)
	$playerExibition.set_visible(false)
	$keepPlaying.set_texture(null)
	self.stop()
	get_node("/root/Node2D/Popup").set_visible(false)
	get_node("/root/Node2D/polaroid3/half1_1").set_block_signals(false)
	get_node("/root/Node2D/polaroid3/half1_2").set_block_signals(false)
	get_node("/root/Node2D/polaroid3_2/half2_1").set_block_signals(false)
	get_node("/root/Node2D/polaroid3_2/half2_2").set_block_signals(false)
	get_node("/root/Node2D/pause").set_block_signals(false)