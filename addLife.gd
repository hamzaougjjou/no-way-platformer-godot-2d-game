extends Area2D
#AddLife.gd
var eated = false
func _on_addLife_body_entered(body):
	var plyr = get_parent().get_parent().get_node("player")
	if ( $Sprite.texture == preload("res://Sprits/coins/heart.png") ):
		if(plyr.health < 4):
			plyr.health += 1
			plyr.checkHelth()
		$Sprite.texture = preload("res://Sprits/coins/heartLoss.png")
		var score_label = get_parent().get_parent().get_node("MainScore/score")
		plyr.score += 10
		score_label.text = "score " + str(plyr.score)
		
		plyr.last_x_position = get_node(".").position.x
		plyr.last_y_position = get_node(".").position.y
		
	if(body.name =="player"):
		if(!eated):
			if( AudioSettings.load_audio_settings().coin == 1 ):
				plyr.get_node("AddLife").play()
			eated = true

