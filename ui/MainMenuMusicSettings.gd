extends Control
 
onready var bu_all = $CenterContainer/VBoxContainer/GridContainer/buAll
onready var bu_jump = $CenterContainer/VBoxContainer/GridContainer2/buJump
onready var bu_coin = $CenterContainer/VBoxContainer/GridContainer3/buCoin
onready var bu_game_over = $CenterContainer/VBoxContainer/GridContainer4/buGameOver
onready var bu_bg = $CenterContainer/VBoxContainer/GridContainer5/buBg

var set 
func _ready():
	var file = File.new()
	if file.file_exists("user://score.json"):
		set = AudioSettings.load_audio_settings()
		set_settings()
	file.close()


func _on_quit_pressed():
	get_tree().paused = false
	$Animation.play("slideOut")

func _on_Animation_animation_finished(anim_name):
	if(anim_name == "slideOut"):
		$Animation.play("RESET")
		$".".visible = false
	if(anim_name == "slideIn"):
		$".".visible = true
		var myx = get_viewport().get_visible_rect().size.x
		var myy = get_viewport().get_visible_rect().size.y
		$".".rect_size.x = myx
		$".".rect_size.y = myy

func set_settings():
	var set0 = set.jump
	var set1 = set.coin
	var set2 = set.gameOver
	var set3 = set.bg
	
	if(set0 == 1 and set1 == 1 and set2 == 1 and set3==1):
		bu_all.pressed = true
	else:
		bu_all.pressed = false
		
	if(int(set0) == 1):
		bu_jump.pressed = true
	else:
		bu_jump.pressed = false

	if(int(set1) == 1):
		bu_coin.pressed = true
	else:
		bu_coin.pressed = false
		
	if(int(set2) == 1):
		bu_game_over.pressed = true
	else:
		bu_game_over.pressed = false	
	
	if(int(set3) == 1):
		bu_bg.pressed = true
	else:
		bu_bg.pressed = false


func update_audio_settings(item,state):
	AudioSettings.update_audio_settings(item,state)

func _on_buAll_pressed():
	if(!bu_all.pressed):
		bu_jump.pressed = false
		bu_coin.pressed = false
		bu_game_over.pressed = false
		bu_bg.pressed = false
	else:
		bu_jump.pressed = true
		bu_coin.pressed = true
		bu_game_over.pressed = true
		bu_bg.pressed = true

func _on_buJump_toggled(button_pressed):
	if(button_pressed):
		update_audio_settings("jump",1)

	else:

		update_audio_settings("jump",0)
		
	if(bu_jump.pressed and bu_coin.pressed and bu_game_over.pressed and bu_bg.pressed):
		bu_all.pressed = true
	else:
		bu_all.pressed = false


func _on_buCoin_toggled(button_pressed):
	if(button_pressed):
		update_audio_settings("coin",1)
	else:
		update_audio_settings("coin",0)
	if(bu_jump.pressed and bu_coin.pressed and bu_game_over.pressed and bu_bg.pressed):
		bu_all.pressed = true
	else:
		bu_all.pressed = false

func _on_buGameOver_toggled(button_pressed):
	if(button_pressed):
		update_audio_settings("gameOver",1)
	else:
		update_audio_settings("gameOver",0)
	if(bu_jump.pressed and bu_coin.pressed and bu_game_over.pressed and bu_bg.pressed):
		bu_all.pressed = true
	else:
		bu_all.pressed = false

func _on_buBg_toggled(button_pressed):
	var root = get_parent().get_node("homeMusic") 
	if(button_pressed):
		root.play()
		root.stream_paused = false
		update_audio_settings("bg",1)
	else:
		root.stream_paused = true
		update_audio_settings("bg",0)
	if(bu_jump.pressed and bu_coin.pressed and bu_game_over.pressed and bu_bg.pressed):
		bu_all.pressed = true
	else:
		bu_all.pressed = false
