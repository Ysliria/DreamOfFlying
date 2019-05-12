extends KinematicBody2D

var vector = 0
var screen_size
var touchesActives = true
var velocity = Vector2(0,0)

signal hit
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if(touchesActives):
		if(Input.is_action_pressed("ui_up")):
			velocity.y = -10
			$AnimatedSprite.play()
#			velocity = velocity.normalized()
			
		elif(Input.is_action_pressed("ui_down")):
			velocity.y = 10
			$AnimatedSprite.play()
#			velocity = velocity.normalized()
		else:
			velocity.y = 0
	
	move_and_collide(velocity, false, true)

func _on_Joueur_body_entered(body):
	queue_free() # Player disappears after being hit.
	emit_signal("hit")

func _on_Area2D_body_entered(body):
	queue_free() # Player disappears after being hit.
	emit_signal("hit")
