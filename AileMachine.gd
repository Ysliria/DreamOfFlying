extends Node2D

var vector = 0
var screen_size
var touchesActives = true
var velocity = Vector2()

export (int) var SPEED

signal hit
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2()
	position.y -= vector
	vector -= 1

	if(touchesActives):
		if(Input.is_action_just_pressed("ui_jump")):
			vector = 10
			$AnimatedSprite.play()
			velocity = velocity.normalized() * SPEED

	position += velocity * delta
	position.y = clamp(position.y, 0, screen_size.y)

func _on_Joueur_body_entered(body):
	queue_free() # Player disappears after being hit.
	emit_signal("hit")
