extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_MachineVolante_pressed():
	GameSingleton.machineChoice = "aile"
	get_tree().change_scene("res://Main.tscn")
