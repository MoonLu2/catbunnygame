extends Node2D

func _process(delta: float):
	var c = $Character
	print(c.position.x)
	c.play()
	c.position.x += 1
	if c.position.x >= 315:
		c.position.x -= 320
	
func _init():
	pass

#func _draw():
	#i += 1
	#print("draw() " + str(i))
