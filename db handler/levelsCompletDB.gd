extends Node

func save_levels_completed():
	var file_data = {
	"1":["true",0],
	"2":["false",0],
	"3":["false",0],
	"4" :["false",0],
	"5" :["false",0],
	"6" :["false",0],
	"7" :["false",0],
	"8" :["false",0],
	"9" :["false",0],
	"10" :["false",0],
	"11" :["false",0],
	"12" :["false",0],
	"13" :["false",0],
	"14" :["false",0],
	"15" :["false",0],
	"16" :["false",0],
	"17" :["false",0],
	"18" :["false",0],
	"19" :["false",0],
	"20" :["false",0],
	"21" :["false",0],
	"22" :["false",0],
	"23" :["false",0],
	"24" :["false",0],
	"25" :["false",0],
	"26" :["false",0],
	"27" :["false",0],
	"28" :["false",0],
	"29" :["false",0],
	"30" :["false",0],
	"31" :["false",0],
	"32" :["false",0],
	"33" :["false",0],
	"34" :["false",0],
	"35" :["false",0],
	"36" :["false",0],
	"37" :["false",0],
	"38" :["false",0],
	"39" :["false",0],
	"40" :["false",0],
	"41" :["false",0],
	"42" :["false",0],
	"43" :["false",0],
	"44" :["false",0],
	"45" :["false",0],
	"46" :["false",0],
	"47" :["false",0],
	"48" :["false",0],
	"49" :["false",0],
	"50" :["false",0],
	"51" :["false",0],
	"52" :["false",0],
	"53" :["false",0],
	"54" :["false",0],
	"55" :["false",0],
	"56" :["false",0],
	"57" :["false",0],
	"58" :["false",0],
	"59" :["false",0],
	"60" :["false",0],
	"61" :["false",0],
	"62" :["false",0],
	"63" :["false",0],
	"64" :["false",0],
	"65" :["false",0],
	"66" :["false",0],
	"67" :["false",0],
	"68" :["false",0],
	"69" :["false",0],
	"70" :["false",0],
	"71" :["false",0],
	"72" :["false",0],
	"73" :["false",0],
	"74" :["false",0],
	"75" :["false",0],
	"76" :["false",0],
	"77" :["false",0],
	"78" :["false",0],
	"79" :["false",0],
	"80" :["false",0],
	"81" :["false",0],
	"82" :["false",0],
	"83" :["false",0],
	"84" :["false",0],
	"85" :["false",0],
	"86" :["false",0],
	"87" :["false",0],
	"88" :["false",0],
	"89" :["false",0],
	"90" :["false",0],
	"91" :["false",0],
	"92" :["false",0],
	"93" :["false",0],
	"94" :["false",0],
	"95" :["false",0],
	"96" :["false",0],
	"97" :["false",0],
	"98" :["false",0],
	"99" :["false",0],
	"100" :["false",0]
}
	var file = File.new()
	if not file.file_exists("user://levels_completed.json"):
		print("file not exist ...")
		file.open("user://levels_completed.json", File.WRITE)
		file.store_line(to_json(file_data))
	file.close()


func load_levels_completed():
	var file = File.new()
	file.open("user://levels_completed.json", File.READ)
	var data = parse_json(file.get_as_text())
	file.close()
	return data

func update_levels_completed(level,is_opened,stars):
	# Load
	var old_data = load_levels_completed()
	#var json = JSON.parse(old_data)
	var new_data = old_data
	# Modify
	new_data[level][0] = is_opened
	new_data[level][1] = stars  
	# Save
	var f = File.new()
	f.open("user://levels_completed.json", File.WRITE)
	f.store_line(to_json(new_data))
	f.close()


