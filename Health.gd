#health.gd
extends Control
export var current_level = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	if(int(current_level) < 10):
		get_node("lvl/level").text = "0"+str(current_level)
	else:
		get_node("lvl/level").text = str(current_level)
	if(current_level==1):
		$prevBtn.visible = false




func _on_prevBtn_pressed():
	get_tree().change_scene("res://levels/level" + str(current_level-1) + ".tscn")
