extends ParallaxLayer

export (int) var velocity = -310

func _process(delta):
	move_local_x(-310 * delta)
	
	if position.x <= -2560:
		position.x = 0