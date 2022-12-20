extends CanvasLayer
 
func _ready():
	pass # Replace with function body.
 

func _on_BuExit_pressed():
	$Container.visible = false
	get_tree().change_scene("res://MainMenu.tscn")


func _on_BuContinue_pressed():
	$Animation.play("slideOut")
 
func _on_Animation_animation_finished(anim_name):
	if(anim_name == "slideOut"):
		$Container.visible = false
	if(anim_name == "slideIn"):
		var myx = get_viewport().get_visible_rect().size.x
		var myy = get_viewport().get_visible_rect().size.y
		$Container.rect_size.x = myx
		$Container.rect_size.y = myy
