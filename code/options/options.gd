extends Control

func _on_ready():
	SoundDriver.overall_bgm_volume = 0.5
	
func exit_options():
	self.queue_free()
