extends Node2D

# Main Variables

var vx = 0
var vy = 0


func _process(delta: float):
	# Identifying $Character as "c" for less typing
	var c = $Character
	
	# Printing CatBunny's Current position and other thinngs for testing purposes (it's not meant to be visible in the game)
	print("vx = " + str(vx) + ", vy = " + str(vy))
	#print("Character.x " + str(c.position.x))
	#print("Character.y " + str(c.position.y))
	c.position.x += vx
	c.position.y -= vy
	
	# Defending the borders so the CatBunny won't go off screen.
	if c.position.x >= 315:
		c.position.x -= 320
	if c.position.x <= -16:
		c.position.x += 320
	if c.position.y <= -22:
		c.position.y += 240
	if c.position.y >= 230:
		c.position.y -= 240

func _init():
	pass

#func _draw():
	#i += 1
	#print("draw() " + str(i))

func _input(event: InputEvent):
	var left_pressed = event.is_action_pressed("ui_left")
	var right_pressed = event.is_action_pressed("ui_right")
	var up_pressed = event.is_action_pressed("ui_up")
	var down_pressed = event.is_action_pressed("ui_down")
	
	var left_released = event.is_action_released("ui_left")
	var right_released = event.is_action_released("ui_right")
	var up_released = event.is_action_released("ui_up")
	var down_released = event.is_action_released("ui_down")
	
	var c = $Character

	# Starting actually walking (moving the character if the arrows pressed and making the speed 0, when released)
	if left_pressed:
		vx -= 2
	if left_released:
		vx += 2
		
	if right_pressed:
		vx += 2
	if right_released:
		vx -= 2
	
	if up_pressed:
		vy += 2
	if up_released:
		vy -= 2
	
	if down_pressed:
		vy -= 2
	if down_released:
		vy += 2


	# Verifying that the speed isn't 0, to continue or else stop the animation.
	if vx != 0 or vy != 0:
		c.play()
	else:
		c.stop()
