extends CharacterBody2D

const UP= Vector2(0, -1) 
var GRAVITY= 30
var MAXFALLSPEED= 1000
var MAXSPEED= 200
var JUMPFORCE = 500
var motion = Vector2()
var jumps = 2
var bullet_speed = 10
var dash = 0



func _ready():
	pass

func _reset_jump():
	JUMPFORCE = 500

func _physics_process(delta):
	dash -= 1
	motion.y += GRAVITY
	
	if dash <= 0 and not(Input.is_action_pressed("ui_right")):
		MAXSPEED = 200

	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left") :
		if dash <= 0:
			dash = 20
		else:
			MAXSPEED = 350
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false
		if is_on_floor():
			$AnimatedSprite.play("run")
		motion.x = MAXSPEED
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.flip_h = true
		if is_on_floor():
			$AnimatedSprite.play("run")
		motion.x = -MAXSPEED
	elif Input.is_action_pressed("punch"):
		$AnimatedSprite.play("hit1")
	elif Input.is_action_pressed("block"):
		$AnimatedSprite.play("block")
	else:
		if is_on_floor():
			$AnimatedSprite.play("default")
		motion.x = 0
	
	if is_on_floor():
		jumps = 2
		motion.y -= get_floor_velocity().y
	else:
		$AnimatedSprite.play("jump")
	if Input.is_action_just_pressed("jump") and jumps > 0:
		jumps -=1
		motion.y = -JUMPFORCE
		
	motion = move_and_slide(motion, UP)
