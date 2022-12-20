extends Node


func save_score():
	var file_data = {
	"1": 0
}
	var file = File.new()
	if not file.file_exists("user://score.json"):
		file.open("user://score.json", File.WRITE)
		file.store_line(to_json(file_data))
	file.close()

func load_score():
	var file = File.new()
	file.open("user://score.json", File.READ)
	var data = parse_json(file.get_as_text())
	file.close()
	return data

func update_score(new_score):
	# Load
	var old_data = load_score()
	#var json = JSON.parse(old_data)
	var new_data = old_data
	# Modify
	new_data["1"] = new_score
	# Save
	var f = File.new()
	f.open("user://score.json", File.WRITE)
	f.store_line(to_json(new_data))
	f.close()
