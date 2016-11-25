extends KinematicBody2D

#GROUND CHECK
var Grounded = false
var Can_Jump = false

#VELOCITY VARIABLE
var velocity = Vector2()

#MOVEMENT CONSTANTS
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_FRICTION = 50
const MOVEMENT_SPEED = 90
const ACCELERATION = 0.4
const GRAVITY = 300
const JUMP_FORCE = 100
const AIR_ACCELERATION = 0.1


func _ready():
	set_fixed_process(true)
	
	
#GROUND CHECK
func _fixed_process(delta):
	if Grounded:
		ground_state(delta)
	else:
		air_state(delta)
		
	velocity = move_and_slide(velocity, FLOOR_NORMAL, SLOPE_FRICTION)
#IF IS ON GROUND
func ground_state(delta):
	print("GROUND")
	#GET MOVEMENT INPUT
	var MOVEMENT = 0
	
	if Input.is_action_pressed("KEY_A"):
		MOVEMENT -= 1
	
	if Input.is_action_pressed("KEY_D"):
		MOVEMENT += 1
	
	MOVEMENT *= MOVEMENT_SPEED
	
	#GET JUMP INPUT
	if Input.is_action_pressed("KEY_SPACE"):
		velocity.y = -JUMP_FORCE
	# LERP HORIZONTAL VELOCITY WITH ACCELERATION
	velocity.x = lerp(velocity.x, MOVEMENT, ACCELERATION)
	
#IS IN AIR STATE
func air_state(delta):
	print("AIR")
	velocity.y += GRAVITY * delta
	
	var MOVEMENT = 0
	
	if Input.is_action_pressed("KEY_A"):
		MOVEMENT -= 1
	
	if Input.is_action_pressed("KEY_D"):
		MOVEMENT += 1
	
	MOVEMENT *= MOVEMENT_SPEED
	
	velocity.x = lerp(velocity.x, MOVEMENT, AIR_ACCELERATION)
	
	
	
func _on_Ground_Check_body_enter( body ):
	var groups = body.get_groups()
	
	if groups.has("solid"):
		Grounded = true


func _on_Ground_Check_body_exit( body ):
	var groups = body.get_groups()
	
	if groups.has("solid"):
		Grounded = false
	