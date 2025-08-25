extends Node2D

var vx = 0


func _process(delta: float):
	var c = $Character
	print("Character.x " + str(c.position.x))
	c.position.x += vx
	if c.position.x >= 315:
		c.position.x -= 320
	
func _init():
	pass

#func _draw():
	#i += 1
	#print("draw() " + str(i))

func _input(event: InputEvent):
	var left = event.is_action_pressed("ui_left")
	var right = event.is_action_pressed("ui_right")
	var c = $Character
	
	if left:
		vx = -1
		c.play()
		
	if right:
		vx = 1
		c.play()
	
	if event.is_action_released("ui_left") \
	   or event.is_action_released("ui_right"):
		vx = 0
		c.stop()
