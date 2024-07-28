extends Control

@onready var slider = $VolumeOption/Slider
@onready var edit = $VolumeOption/Edit

func _on_ready():
	slider.set_value_no_signal(SoundDriver.overall_bgm_volume * 100)
	edit.set_value_no_signal(SoundDriver.overall_bgm_volume * 100)
	
func exit_options():
	self.queue_free()

func volume_changed(value):
	SoundDriver.overall_bgm_volume = value / 100
	slider.set_value_no_signal(value)
	edit.set_value_no_signal(value)
