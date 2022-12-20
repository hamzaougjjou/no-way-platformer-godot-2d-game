extends Area2D

var blood = preload("res://blood.tscn")
var blood_instance 

func _on_fire_body_entered(body):
	blood_instance = blood.instance()
	if(body.name =="player"):
		var plyr = get_parent().get_parent().get_node("player")
		plyr.play_game_over_music()
		plyr.health -= 1
		
		blood_instance.position = plyr.get_global_position()
		get_tree().get_root().add_child(blood_instance)
		
		blood_instance.one_shot = true
		blood_instance.emitting = true
		yield(get_tree().create_timer(0.5), "timeout")
		
		plyr.checkHelth()
		plyr.get_tree().paused = true
		plyr.position.x = plyr.last_x_position
		plyr.position.y = plyr.last_y_position
		plyr.move_to_new_position( plyr.position )

		if(plyr.health > 0):
			plyr.get_node("lossGame/Container").show()
			plyr.get_node("lossGame/Animation").play("slider")




