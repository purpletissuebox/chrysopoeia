extends Node

const TRACKLIST:BGM_Tracklist = preload("res://assets/audio/bgm/TRACKLIST.tres")
var bgm_player:AudioStreamPlayer
var fader

var overall_bgm_volume = 1.0:
	set(x):
		overall_bgm_volume = x
		bgm_player.volume_db = linear_to_db(overall_bgm_volume)
	get:
		return overall_bgm_volume

const BGM_SONG_PATH = "res://assets/audio/bgm/"

enum SONG_IDS
{
	FIRST_SONG,
}

func _ready():
	bgm_player = AudioStreamPlayer.new()
	fader = self.create_tween().set_trans(Tween.TRANS_CIRC)
	self.add_child(bgm_player)

func playBGM(song:SONG_IDS, speed: float = 1.0):
	var stream_data = createStream(TRACKLIST.songs[song])
	
	fader.tween_property(bgm_player, "volume_db", -60, speed/2)
	fader.play()
	await fader.finished
	fader.stop()
	
	bgm_player.stop()
	bgm_player.stream = stream_data
	bgm_player.play()
	
	fader.tween_property(bgm_player, "volume_db", linear_to_db(overall_bgm_volume), speed/2)
	fader.play()
	await fader.finished
	fader.stop()

func createStream(track:BGM_Sequence):
	var result: AudioStream = load(BGM_SONG_PATH + track.name)
	
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
