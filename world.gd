extends Node2D

# Main Variables

var vx = 0
var vy = 0


func _process(delta: float):
	# Identifying $Character as "c" for less typing
	var c = $Character
	
	# Printing CatBunny's Current position for testing purposes (it's not meant to be visible in the game)
	print("Character.x " + str(c.position.x))
	print("Character.y " + str(c.position.y))
	c.position.x += vx
	c.position.y -= vy
	
	# Defending the borders so the CaBunny won't go off screen.
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
	var left = event.is_action_pressed("ui_left")
	var right = event.is_action_pressed("ui_right")
	var up = event.is_action_pressed("ui_up")
	var down = event.is_action_pressed("ui_down")
	var c = $Character
	
					# Walking Start
	if left:
		vx = -2
		c.play()
		
	if right:
		vx = 2
		c.play()
	
	if up:
		vy = 2
		c.play()
	
	if down:
		vy = -2
		c.play()

					# Walking stop
	
	if event.is_action_released("ui_left") \
	   or event.is_action_released("ui_right"):
		vx = 0
		c.stop()


	if event.is_action_released("ui_up") \
	   or event.is_action_released("ui_down"):
		vy = 0
		c.stop()
