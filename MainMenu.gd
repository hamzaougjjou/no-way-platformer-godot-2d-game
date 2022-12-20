#main menu Script
extends CanvasLayer
var musicPlayed


onready var game_name = $GridContainer4/gameName
onready var heightScore = $GridContainer3/HBoxContainer/HeightScore
onready var buttons = [
					get_node("LeftPanel/ScrollContainer/levles/L1"),
					get_node("LeftPanel/ScrollContainer/levles/L2"),
					get_node("LeftPanel/ScrollContainer/levles/L3"),
					get_node("LeftPanel/ScrollContainer/levles/L4"),
					get_node("LeftPanel/ScrollContainer/levles/L5"),
					get_node("LeftPanel/ScrollContainer/levles/L6"),
					get_node("LeftPanel/ScrollContainer/levles/L7"),
					get_node("LeftPanel/ScrollContainer/levles/L8"),
					get_node("LeftPanel/ScrollContainer/levles/L9"),
					get_node("LeftPanel/ScrollContainer/levles/L10"),
					get_node("LeftPanel/ScrollContainer/levles/L11"),
					get_node("LeftPanel/ScrollContainer/levles/L12"),
					get_node("LeftPanel/ScrollContainer/levles/L13"),
					get_node("LeftPanel/ScrollContainer/levles/L14"),
					get_node("LeftPanel/ScrollContainer/levles/L15"),
					get_node("LeftPanel/ScrollContainer/levles/L16"),
					get_node("LeftPanel/ScrollContainer/levles/L17"),
					get_node("LeftPanel/ScrollContainer/levles/L18"),
					get_node("LeftPanel/ScrollContainer/levles/L19"),
					get_node("LeftPanel/ScrollContainer/levles/L20"),
					get_node("LeftPanel/ScrollContainer/levles/L21"),
					get_node("LeftPanel/ScrollContainer/levles/L22"),
					get_node("LeftPanel/ScrollContainer/levles/L23"),
					get_node("LeftPanel/ScrollContainer/levles/L24"),
					get_node("LeftPanel/ScrollContainer/levles/L25"),
					get_node("LeftPanel/ScrollContainer/levles/L26"),
					get_node("LeftPanel/ScrollContainer/levles/L27"),
					get_node("LeftPanel/ScrollContainer/levles/L28"),
					get_node("LeftPanel/ScrollContainer/levles/L29"),
					get_node("LeftPanel/ScrollContainer/levles/L30"),
					get_node("LeftPanel/ScrollContainer/levles/L31"),
					get_node("LeftPanel/ScrollContainer/levles/L32"),
					get_node("LeftPanel/ScrollContainer/levles/L33"),
					get_node("LeftPanel/ScrollContainer/levles/L34"),
					get_node("LeftPanel/ScrollContainer/levles/L35"),
					get_node("LeftPanel/ScrollContainer/levles/L36"),
					get_node("LeftPanel/ScrollContainer/levles/L37"),
					get_node("LeftPanel/ScrollContainer/levles/L38"),
					get_node("LeftPanel/ScrollContainer/levles/L39"),
					get_node("LeftPanel/ScrollContainer/levles/L40"),
					get_node("LeftPanel/ScrollContainer/levles/L41"),
					get_node("LeftPanel/ScrollContainer/levles/L42"),
					get_node("LeftPanel/ScrollContainer/levles/L43"),
					get_node("LeftPanel/ScrollContainer/levles/L44"),
					get_node("LeftPanel/ScrollContainer/levles/L45"),
					get_node("LeftPanel/ScrollContainer/levles/L46"),
					get_node("LeftPanel/ScrollContainer/levles/L47"),
					get_node("LeftPanel/ScrollContainer/levles/L48"),
					get_node("LeftPanel/ScrollContainer/levles/L49"),
					get_node("LeftPanel/ScrollContainer/levles/L50"),
					get_node("LeftPanel/ScrollContainer/levles/L51"),
					get_node("LeftPanel/ScrollContainer/levles/L52"),
					get_node("LeftPanel/ScrollContainer/levles/L53"),
					get_node("LeftPanel/ScrollContainer/levles/L54"),
					get_node("LeftPanel/ScrollContainer/levles/L55"),
					get_node("LeftPanel/ScrollContainer/levles/L56"),
					get_node("LeftPanel/ScrollContainer/levles/L57"),
					get_node("LeftPanel/ScrollContainer/levles/L58"),
					get_node("LeftPanel/ScrollContainer/levles/L59"),
					get_node("LeftPanel/ScrollContainer/levles/L60"),
					get_node("LeftPanel/ScrollContainer/levles/L61"),
					get_node("LeftPanel/ScrollContainer/levles/L62"),
					get_node("LeftPanel/ScrollContainer/levles/L63"),
					get_node("LeftPanel/ScrollContainer/levles/L64"),
					get_node("LeftPanel/ScrollContainer/levles/L65"),
					get_node("LeftPanel/ScrollContainer/levles/L66"),
					get_node("LeftPanel/ScrollContainer/levles/L67"),
					get_node("LeftPanel/ScrollContainer/levles/L68"),
					get_node("LeftPanel/ScrollContainer/levles/L69"),
					get_node("LeftPanel/ScrollContainer/levles/L70"),
					get_node("LeftPanel/ScrollContainer/levles/L71"),
					get_node("LeftPanel/ScrollContainer/levles/L72"),
					get_node("LeftPanel/ScrollContainer/levles/L73"),
					get_node("LeftPanel/ScrollContainer/levles/L74"),
					get_node("LeftPanel/ScrollContainer/levles/L75"),
					get_node("LeftPanel/ScrollContainer/levles/L76"),
					get_node("LeftPanel/ScrollContainer/levles/L77"),
					get_node("LeftPanel/ScrollContainer/levles/L78"),
					get_node("LeftPanel/ScrollContainer/levles/L79"),
					get_node("LeftPanel/ScrollContainer/levles/L80"),
					get_node("LeftPanel/ScrollContainer/levles/L81"),
					get_node("LeftPanel/ScrollContainer/levles/L82"),
					get_node("LeftPanel/ScrollContainer/levles/L83"),
					get_node("LeftPanel/ScrollContainer/levles/L84"),
					get_node("LeftPanel/ScrollContainer/levles/L85"),
					get_node("LeftPanel/ScrollContainer/levles/L86"),
					get_node("LeftPanel/ScrollContainer/levles/L87"),
					get_node("LeftPanel/ScrollContainer/levles/L88"),
					get_node("LeftPanel/ScrollContainer/levles/L89"),
					get_node("LeftPanel/ScrollContainer/levles/L90"),
					get_node("LeftPanel/ScrollContainer/levles/L91"),
					get_node("LeftPanel/ScrollContainer/levles/L92"),
					get_node("LeftPanel/ScrollContainer/levles/L93"),
					get_node("LeftPanel/ScrollContainer/levles/L94"),
					get_node("LeftPanel/ScrollContainer/levles/L95"),
					get_node("LeftPanel/ScrollContainer/levles/L96"),
					get_node("LeftPanel/ScrollContainer/levles/L97"),
					get_node("LeftPanel/ScrollContainer/levles/L98"),
					get_node("LeftPanel/ScrollContainer/levles/L99"),
					get_node("LeftPanel/ScrollContainer/levles/L100"),
					
	]
var levels_completed_data
var timerFinished = false
func _ready():
	
	var file = File.new()
	if not file.file_exists("user://score.json"):
		AudioSettings.save_audio_settings()
		AudioSettings.save_audio_settings()
		LastLevelDb.save_last_level()
		ScoreDb.save_score()
		LevelsCompletDb.save_levels_completed()
		LastLevelDb.save_last_level()
		get_tree().reload_current_scene()
	file.close()
	get_tree().paused = false
	$AdMob.load_banner()
	$AdMob.show_banner()
	
	if(AudioSettings.load_audio_settings().bg == 1):
		$homeMusic.play()
	levels_completed_data = LevelsCompletDb.load_levels_completed()
	var db_score = str( ScoreDb.load_score()['1'] )

	if( int( db_score ) < 10):
		heightScore.text = "00" + str(db_score) 
	elif( int( db_score ) < 100):
		heightScore.text = "0" + str(db_score)
	else:
		heightScore.text = str(db_score)
	
	for i in range(0,100):
		if(i<9):
			buttons[i].get_node("lblLevel").text = "0"+ str(i+1)
		else:
			buttons[i].get_node("lblLevel").text = str(i+1)
		if(i<25):
			if str(levels_completed_data[ str(i+1) ][0] ) == "true" :
				buttons[i].get_node("lock").visible = false
				buttons[i].get_node("lblLevel").visible = true

				if (int( levels_completed_data[ str(i+1) ][1] ) <= 1):
					buttons[i].get_node("Estar1").visible = true
					buttons[i].get_node("Estar2").visible = true
					buttons[i].get_node("Estar3").visible = true

				elif (int( levels_completed_data[ str(i+1) ][1] ) == 2):
					buttons[i].get_node("Estar1").visible = false
					buttons[i].get_node("Estar2").visible = true
					buttons[i].get_node("Estar3").visible = true

				elif (int( levels_completed_data[ str(i+1) ][1] ) == 3):
					buttons[i].get_node("Estar1").visible = false
					buttons[i].get_node("Estar2").visible = false
					buttons[i].get_node("Estar3").visible = true

				elif (int( levels_completed_data[ str(i+1) ][1] ) == 4 ):
					buttons[i].get_node("Estar1").visible = false
					buttons[i].get_node("Estar2").visible = false
					buttons[i].get_node("Estar3").visible = false

				else:
					buttons[i].get_node("star1").visible = true
					buttons[i].get_node("star2").visible = true
					buttons[i].get_node("star3").visible = true

	#add some inmation to name of game
	var old_game_name = game_name.text
	var txt = ""
	timerFinished = false
	for i in range(0,len(old_game_name)):
		timerFinished = false
		yield(get_tree().create_timer(0.1), "timeout")
		txt += old_game_name[i]
		game_name.text = txt
	timerFinished = true
 

func _on_soundsStatButton_pressed():
	$musucSettings/Animation.play("slideIn")
	$musucSettings.visible = true
 
###############################################
func _on_play_pressed() -> void:
	if(timerFinished ):
		get_tree().change_scene("res://levels/level1.tscn")

func _on_buContinue_pressed() -> void:
	if(timerFinished):
		get_tree().change_scene("res://levels/level14.tscn")
		#get_tree().change_scene("res://levels/"+ LastLevelDb.load_last_level()['1'] +".tscn")

func _on_ShareGame_pressed() -> void:
	print("SHAIRE GAME BUTTON IS CLICKED !!!")

func lshowLlUnluckedMsg()  -> void:
	$lvlUnluckedMsg.visible = true
	timerFinished = false
	yield(get_tree().create_timer(1.0), "timeout")
	$lvlUnluckedMsg.visible = false
	timerFinished = true

func check_if_level_open(level_number):
	for i in range(1,26) :
		if ( 
			 str(level_number) == str(i)
			 and str(levels_completed_data[str(i)][0]) =="true" ):
			$lvlUnluckedMsg.visible = false
			get_tree().change_scene("res://levels/level" + str(level_number) + ".tscn")
			$BtnsClickAudio.play()
			break
#		else:
#			lshowLlUnluckedMsg()
		if (not ( int(level_number) < int(i) and str(levels_completed_data[str(i)][0]) =="false") ):
			lshowLlUnluckedMsg()
 

func _on_L1_pressed():
	check_if_level_open(1)
func _on_L2_pressed():
	check_if_level_open(2)
func _on_L3_pressed():
	check_if_level_open(3)
func _on_L4_pressed():
	check_if_level_open(4)
func _on_L5_pressed():
	check_if_level_open(5)
func _on_L6_pressed():
	check_if_level_open(6)
func _on_L7_pressed():
	check_if_level_open(7)
func _on_L8_pressed():
	check_if_level_open(8)
func _on_L9_pressed():
	check_if_level_open(9)
func _on_L10_pressed():
	check_if_level_open(10)
func _on_L11_pressed():
	check_if_level_open(11)
func _on_L12_pressed():
	check_if_level_open(12)
func _on_L13_pressed():
	check_if_level_open(13)
func _on_L14_pressed():
	check_if_level_open(14)
func _on_L15_pressed():
	check_if_level_open(15)
func _on_L16_pressed():
	check_if_level_open(16)
func _on_L17_pressed():
	check_if_level_open(17)
func _on_L18_pressed():
	check_if_level_open(18)
func _on_L19_pressed():
	check_if_level_open(19)
func _on_L20_pressed():
	check_if_level_open(20)
func _on_L21_pressed():
	check_if_level_open(21)
func _on_L22_pressed():
	check_if_level_open(22)
func _on_L23_pressed():
	check_if_level_open(23)
func _on_L24_pressed():
	check_if_level_open(24)
func _on_L25_pressed():
	check_if_level_open(25)

func _on_none_level_pressed():
	$BtnsClickAudio.play()
	lshowLlUnluckedMsg()

func _on_exit_pressed():
	$quitGame.get_node("Control").visible = true
	$quitGame.get_node("Animation").play("slideIn")

func _on_MainMenu_tree_exited():
	$AdMob.hide_banner()


func _on_all_botton_pressed():
	$BtnsClickAudio.play()

func _on_BtnsClickAudio_finished():
	$BtnsClickAudio.stop()


func _on_homeMusic_finished():
	if(AudioSettings.load_audio_settings().bg == 1):
		$homeMusic.play()


func _on_AdMob_banner_loaded():
	$AdMob.show_banner()
