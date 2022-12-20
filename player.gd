extends KinematicBody2D

onready var last_y_position  
onready var last_x_position

export var multy_jump = true

export var flip_h = 0
var health = 4
var score = 0
#motion variable 
var motion = Vector2()
const UP = Vector2(0,-1)

var jumpSpeed = 400 #jupm sppeed whene click up button 
var step = 400 #walk steps //400
var gravity = 10 #player gravity when he jumped
var maxJumpSped = 600
#animation variables
const run = "Run"
const jump = "Jump"
const fall = "Fall"
const idle = "Idle"
var musicIcon 


 
onready var current_level = get_parent().get_node("MainHealth/Health").current_level
var jump_music
var coin_music
var gameOver_music
var bg_music

#start play sound when game start
func _ready():
	var all_audio_set = AudioSettings.load_audio_settings()
	
	jump_music = int( all_audio_set.jump )
	coin_music = int( all_audio_set.coin )
	gameOver_music = int( all_audio_set.gameOver )
	bg_music = int( all_audio_set.bg )
	
	LastLevelDb.update_last_level("level" + str(current_level))
	
	#flip player horizontal
	if(flip_h == 1):
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	last_x_position = get_node(".").position.x
	last_y_position = get_node(".").position.y
	musicIcon = $setting/SettingGrid/SettingContainer/musicIcon
	
	get_tree().paused = false
	if bg_music == 1:
		$MainMusic.play()
		$MainMusic.stream_paused = false
	else:
		$MainMusic.stream_paused = true

func _physics_process(delta):
	#move 100 to right when user click on right button	
	if Input.is_action_pressed("ui_right"):
		motion.x = step 
		step += 0.5
		$Sprite.flip_h = false
		$Sprite.play(run)
		if is_on_floor():
			jumpSpeed = 400
	#move 100 to left when user click on left button
	elif Input.is_action_pressed("ui_left"):
		motion.x = -step
		step += 0.5
		$Sprite.flip_h = true
		$Sprite.play(run)
		if is_on_floor():
			jumpSpeed = 400
	else:
		motion.x = 0
		step = 400
		$Sprite.play(idle)
	#add jump deisr=tance when user still press on UP bottom
	if( Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_accept") ):
		if (is_on_floor() and jump_music==1):
			$jump.play()
			
		if(multy_jump):
			if ( jumpSpeed <= maxJumpSped):
				jumpSpeed = jumpSpeed+ (0.5)
			else:
				jumpSpeed = jumpSpeed
		else:
			jumpSpeed= 400
	else:
		jumpSpeed= 400
		
	if Input.is_action_just_pressed("ui_down"):
		if !is_on_floor():
			motion.y = jumpSpeed
	if is_on_floor(): #check if player is on floor
		#jump 400 to top when user click up button
		motion.y = gravity;
		if ( Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_accept") ):
			motion.y = -jumpSpeed
	else:
		motion.y += gravity
		if motion.y < 0:
			$Sprite.play(jump)
		else:
			$Sprite.play(fall)
	move_and_slide(motion,UP)

func checkHelth():
		#declatrate health variables 
	var health_0 = get_parent().get_node("MainHealth/Health/health_0")
	var health_1 = get_parent().get_node("MainHealth/Health/health_1")
	var health_2 = get_parent().get_node("MainHealth/Health/health_2")
	if health == 4:
		health_0.texture = preload("res://Sprits/coins/heart.png")
		health_1.texture = preload("res://Sprits/coins/heart.png")
		health_2.texture = preload("res://Sprits/coins/heart.png")
	elif health == 3:
		health_2.texture = preload("res://Sprits/coins/heartLoss.png")
		health_0.texture = preload("res://Sprits/coins/heart.png")
		health_1.texture = preload("res://Sprits/coins/heart.png")
	elif health == 2:
		health_1.texture = preload("res://Sprits/coins/heartLoss.png")
		health_0.texture = preload("res://Sprits/coins/heart.png")
	elif health == 1:
		health_0.texture = preload("res://Sprits/coins/heartLoss.png")
	else:
		$gameOver/Container.visible = true
		$gameOver.get_node("Animation").play("slideIn")

func _on_musicIcon_pressed():
	get_tree().paused = true
	$musiSet/musucSettings/Animation.play("slideIn")
	$musiSet/musucSettings.visible = true

func _on_quitIcon_pressed():
	$closeLevel/Container.visible = true
	$closeLevel/Animation.play("slideIn")

func move_to_new_position(position):
	move_and_slide(position)

func play_coin_sound():
	if(coin_music == 1):
		$coinSound.play()
	
func play_game_over_music():
	if(gameOver_music == 1):
		$game_over_music.play()

func _on_coinSound_finished():
	$coinSound.stop()

func _on_jump_finished():
	pass # Replace with function body.

func _on_AddLife_finished():
	$AddLife.stop()
	pass # Replace with function body.


func _on_MainMusic_finished():
	$MainMusic.play()
