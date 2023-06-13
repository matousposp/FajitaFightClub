extends CharacterBody2D

const UP = Vector2(0, -1)
var GRAVITY = 30
var MAX_FALL_SPEED = 1000
var MAX_SPEED = 200
var JUMP_FORCE = 500
var motion = Vector2()
var jumps = 2
var bullet_speed = 10
var dash = 0

func _enter_tree() -> void:
	set_multiplayer_authority(str(name).to_int()) 

func _physics_process(delta: float) -> void:
	if !is_multiplayer_authority(): return
	$Camera2D.enabled = true
	
	dash -= 1
	motion.y += GRAVITY * delta
	
	if dash <= 0 and not(Input.is_action_pressed("ui_right")):
		MAX_SPEED = 200

	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		if dash <= 0:
			dash = 20
		else:
			MAX_SPEED = 350
			
	if motion.y > MAX_FALL_SPEED:
		motion.y = MAX_FALL_SPEED
	
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false
		if is_on_floor():
			$AnimatedSprite.play("run")
		motion.x = MAX_SPEED
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.flip_h = true
		if is_on_floor():
			$AnimatedSprite.play("run")
		motion.x = -MAX_SPEED
	elif Input.is_action_pressed("punch"):
		$AnimatedSprite.play("hit1")
	elif Input.is_action_pressed("block"):
		$AnimatedSprite.play("block")
	else:
		if is_on_floor():
			$AnimatedSprite.play("default")
		motion.x = 0
	
	motion = motion.slide(UP)  
	
	if is_on_floor():
		jumps = 2
	else:
		$AnimatedSprite.play("jump")
		
	if Input.is_action_just_pressed("jump") and jumps > 0:
		jumps -= 1
		motion.y = -JUMP_FORCE

func _reset_jump():
	JUMP_FORCE = 500 
