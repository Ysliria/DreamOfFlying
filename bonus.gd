extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal emie
# Called when the node enters the scene tree for the first time.
func _ready():
	
	$images.frame = int(rand_range(-1,3))
	
	


		




func _on_bonus_body_entered(body):
	queue_free()
