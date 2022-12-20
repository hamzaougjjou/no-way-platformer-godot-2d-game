extends Area2D
#coin.gd

func _on_coin_body_entered(body):
	if( body.name == "player"): 
		var plyr = get_parent().get_parent().get_node("player")
		var score_label = get_parent().get_parent().get_node("MainScore/score")
		plyr.play_coin_sound()
		plyr.score += 1
		
		if( plyr.score < 10):
			score_label.text = "score " + "0" + str(plyr.score)
		else:
			score_label.text = "score " + str(plyr.score)
		queue_free()
	pass # Replace with function body.
