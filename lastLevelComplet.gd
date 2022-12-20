extends Area2D

export var next_level = "level2"

var plyr
var current_level 

func _ready():
	plyr = get_parent().get_node("player")
	current_level = get_parent().get_node("MainHealth/Health").current_level

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "player":
			var scor = int(plyr.score)
			var coinsLabel = $winGame/Container/GridContainer/coins
			get_node("winGame").stars_set(int(plyr.health))
			if(scor<10):
				coinsLabel.text = "00"+str(scor)
			elif(scor<100):
				coinsLabel.text = "0"+str(scor)
			else:
				coinsLabel.text = str(scor)
			
			$winGame.get_node("Animation").play("RESET")
			$winGame/Container.visible = true
			$winGame.get_node("Animation").play("slideIn")
			
			get_tree().paused = true
			
 
func goNextLevel():
	#GO TO NEXT SCENE (LEVEL)
	update_completed_levels(current_level,plyr.health)
	#check if new score greater tha old score and update it in DB
	if int( get_height_score_fromdb() ) < int(plyr.score):
		#updte score in dataBase
		update_score_in_db(plyr.score)
	get_tree().change_scene("res://MainMenu.tscn")
func update_completed_levels(level,stars):
	LevelsCompletDb.update_levels_completed(str(level+1),"true",0)
	if(LevelsCompletDb.load_levels_completed()[str(level)][1] <= int(stars) ):
		LevelsCompletDb.update_levels_completed(str(level),"true",stars)

func get_height_score_fromdb():
	return ScoreDb.load_score()['1']

#function to update score in database
func update_score_in_db(newScore):
	ScoreDb.update_score(newScore)

