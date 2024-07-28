extends Control

@onready var music_slider = $HBoxContainer/VBoxContainer/MusicVolumeOption/Slider
@onready var music_edit = $HBoxContainer/VBoxContainer/MusicVolumeOption/Edit

@onready var sfx_slider = $HBoxContainer/VBoxContainer/SFXVolumeOption/Slider
@onready var sfx_edit = $HBoxContainer/VBoxContainer/SFXVolumeOption/Edit


func _on_ready():
	music_slider.set_value_no_signal(SoundDriver.overall_bgm_volume * 100)
	music_edit.set_value_no_signal(SoundDriver.overall_bgm_volume * 100)
	sfx_slider.set_value_no_signal(SoundDriver.overall_sfx_volume * 100)
	sfx_edit.set_value_no_signal(SoundDriver.overall_sfx_volume * 100)
	
func exit_options():
	self.queue_free()

func music_volume_changed(value):
	SoundDriver.overall_bgm_volume = value / 100
	music_slider.set_value_no_signal(value)
	music_edit.set_value_no_signal(value)

func sfx_volume_changed(value):
	SoundDriver.overall_sfx_volume = value / 100
	sfx_slider.set_value_no_signal(value)
	sfx_edit.set_value_no_signal(value)
