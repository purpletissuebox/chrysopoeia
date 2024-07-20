extends Node

const SFXLIST:SFX_Tracklist = preload("res://assets/audio/sfx/SFXLIST.tres")
const TRACKLIST:BGM_Tracklist = preload("res://assets/audio/bgm/TRACKLIST.tres")
var bgm_player:AudioStreamPlayer

var overall_sfx_volume:float = 1.0
var overall_bgm_volume:float = 1.0:
	set(x):
		overall_bgm_volume = x
		bgm_player.volume_db = linear_to_db(overall_bgm_volume)
	get:
		return overall_bgm_volume

const BGM_FILE_PATH = "res://assets/audio/bgm/"
const SFX_FILE_PATH = "res://assets/audio/sfx/"

enum BGM_IDS
{
	FIRST_SONG,
}

enum SFX_IDS
{
	SHRED,
}

func _ready():
	bgm_player = AudioStreamPlayer.new()
	self.add_child(bgm_player)

func playSFX(effect:SFX_IDS):
	var stream_data = load(SFX_FILE_PATH + SFXLIST.songs[effect])
	var player:AudioStreamPlayer = AudioStreamPlayer.new()
	player.stream = stream_data
	player.volume_db = linear_to_db(overall_sfx_volume)
	player.finished.connect(endSFX.bind(player))
		
	self.add_child(player)
	player.play()

func endSFX(child:AudioStreamPlayer):
	child.stop()
	self.remove_child(child)
	child.queue_free()

func playBGM(song:BGM_IDS, transition_length: float = 1.0):
	var stream_data = createStream(TRACKLIST.songs[song])
	var fader = create_tween()
	
	fader.tween_property(bgm_player, "volume_db", -60, transition_length/2.0)
	fader.play()
	await fader.finished
	fader.stop()
	
	bgm_player.stop()
	bgm_player.stream = stream_data
	bgm_player.play()
	
	fader.tween_property(bgm_player, "volume_db", linear_to_db(overall_bgm_volume), transition_length/2.0)
	fader.play()
	await fader.finished
	fader.stop()

func createStream(track:BGM_Sequence):
	var result: AudioStream = load(BGM_FILE_PATH + track.name)
	
	match track.name.get_extension():
		"mp3":
			result = result as AudioStreamMP3
			result.loop = true
			if track.loop_start != -1.0:
				result.loop_offset = track.loop_start
			else:
				result.loop_offset = 0
		"wav":
			result = result as AudioStreamWAV
			result.set_loop_mode(AudioStreamWAV.LOOP_FORWARD)
			if track.loop_start != -1.0:
				result.loop_start = track.loop_start * result.mix_rate
			else:
				result.loop_start = 0
			if track.loop_end != -1.0:
				result.loop_end = track.loop_end * result.mix_rate
			else:
				result.loop_end = result.get_length() * result.mix_rate
		"ogg":
			result = result as AudioStreamOggVorbis
			result.loop = true
			if track.loop_start != -1.0:
				result.loop_offset = track.loop_start
			else:
				result.loop_offset = 0
		_:
			return null
	return result
