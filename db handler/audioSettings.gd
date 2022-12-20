extends Node


func save_audio_settings():
	var file_data = {
	"jump": 1,
	"coin": 1,
	"gameOver": 1,
	"bg": 1
}
	var file = File.new()
	if not file.file_exists("user://audio_settings.json"):
		file.open("user://audio_settings.json", File.WRITE)
		file.store_line(to_json(file_data))
	file.close()

func load_audio_settings():
	var file = File.new()
	file.open("user://audio_settings.json", File.READ)
	var data = parse_json(file.get_as_text())
	file.close()
	return data

func update_audio_settings(key,val):
	# Load
	var old_data = load_audio_settings()
	#var json = JSON.parse(old_data)
	var new_data = old_data
	# Modify
	new_data[key] = val
	# Save
	var f = File.new()
	f.open("user://audio_settings.json", File.WRITE)
	f.store_line(to_json(new_data))
	f.close()
