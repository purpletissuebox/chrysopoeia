extends Equipment

func jumped_triggered(args: Array):
	var wearer: Entity = args[0]
	wearer.velocity.y *= 2
