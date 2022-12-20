extends CanvasLayer

onready var root = get_node("Control")
 
func _on_ok_pressed():
	get_node("Animation").play("slideOut")
	root.visible = false
	get_tree().quit()

func _on_cancel_pressed():
	get_node("Animation").play("slideOut")

func _on_Animation_animation_finished(anim_name):
	if(anim_name == "slideOut"):
		root.visible = false
	if(anim_name == "slideIn"):
		root.visible = true
		var myx = get_viewport().get_visible_rect().size.x
		var myy = get_viewport().get_visible_rect().size.y
		$Control.rect_size.x = myx
		$Control.rect_size.y = myy

