extends CanvasLayer

#poUpMenu.gd
var music 
onready var BuAd = $Container/centerMenu/CenterContainer/MarginContainer/VBoxContainer/watchAd
var isConnected

func _ready():
	$AdMob.load_rewarded_video()
	music = get_parent().get_node("MainMusic")

func _on_BuContinue_pressed():
	get_tree().paused = false
	$Container.hide()

func _on_watchAd_button_down():
	$AdMob.show_rewarded_video()

func _on_BuExit_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
	get_tree().paused = false

func _on_BuPlayAgain_pressed():
	get_tree().reload_current_scene()

func _on_Animation_animation_finished(anim_name):
	if(anim_name == "slideIn"):
	#	$Animation.play("RESET")
		var myx = get_viewport().get_visible_rect().size.x
		var myy = get_viewport().get_visible_rect().size.y
		$Container.rect_size.x = myx
		$Container.rect_size.y = myy

func _on_AdMob_rewarded_video_loaded():
	BuAd.visible = true

func _on_AdMob_rewarded(currency, ammount):
	var plyr = get_parent().get_parent().get_node("player")
	plyr.position.x = plyr.last_x_position
	plyr.position.y = plyr.last_y_position
	plyr.move_to_new_position( plyr.position )
	$Container.visible = false
	plyr.health += 1
	get_tree().paused = false
	$AdMob.load_rewarded_video()



func _on_AdMob_rewarded_video_opened():
	$AdMob.load_rewarded_video()


func _on_AdMob_rewarded_video_closed():
	$AdMob.load_rewarded_video()


func _on_AdMob_rewarded_video_left_application():
	$AdMob.load_rewarded_video()
