extends Node

func save_last_level():
	var file_data = {
	"1": "level1"
	}
	var file = File.new()
	if not file.file_exists("user://last_level.json"):
		file.open("user://last_level.json", File.WRITE)
		file.store_line(to_json(file_data))
	file.close()

func load_last_level():
	var file = File.new()
	file.open("user://last_level.json", File.READ)
	var data = parse_json(file.get_as_text())
	file.close()
	return data

func update_last_level(new_level):
	# Load
	var old_data = load_last_level()
	#var json = JSON.parse(old_data)
	var new_data = old_data
	# Modify
	new_data["1"] = new_level
	# Save
	var f = File.new()
	f.open("user://last_level.json", File.WRITE)
	f.store_line(to_json(new_data))
	f.close()
