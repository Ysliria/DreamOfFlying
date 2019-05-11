extends ParallaxLayer

export (int) var velocity = -510

func _process(delta):
	move_local_x(-510*delta)
	
	if position.x <= -2560:
		position.x = 0