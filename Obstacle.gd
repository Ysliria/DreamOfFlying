extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	position.y = (randi() % 300) + 150

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 5

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
