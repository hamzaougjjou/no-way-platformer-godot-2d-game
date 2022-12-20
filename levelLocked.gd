extends TextureButton

export var lvlText = 1

onready var lblLevel = get_node("lblLevel")

func _ready():
	lblLevel.text = str(lvlText)








