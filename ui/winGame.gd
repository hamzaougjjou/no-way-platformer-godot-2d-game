#WINgAME.GD
extends CanvasLayer

onready var root = get_parent()
onready var coinsLabel = $Container/GridContainer/coins


func _on_BuPlayAgain_pressed():
	get_tree().reload_current_scene()


func _on_BuNextLevel_pressed():
	root.goNextLevel()

func stars_set(num):
	if(num>=4):
		$Container/HBoxContainer/Estar1.visible = false
		$Container/HBoxContainer/Estar2.visible = false
		$Container/HBoxContainer/Estar3.visible = false
	elif(num==3):
		$Container/HBoxContainer/Estar1.visible = false
		$Container/HBoxContainer/Estar2.visible = false
	elif(num==2):
		$Container/HBoxContainer/Estar1.visible = false
	else:
		$Container/HBoxContainer/Estar1.visible = true
		$Container/HBoxContainer/Estar2.visible = true
		$Container/HBoxContainer/Estar3.visible = true


func _on_Animation_animation_finished(anim_name):
	if(anim_name == "slideIn"):
		var myx = get_viewport().get_visible_rect().size.x
		var myy = get_viewport().get_visible_rect().size.y
		$Container.rect_size.x = myx
		$Container.rect_size.y = myy
