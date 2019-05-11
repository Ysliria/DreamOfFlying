extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_VisAerienne_pressed():
	GameSingleton.machineChoice = "vis"
	get_tree().change_scene("res://Main.tscn")
