extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

const UP = Vector2(0, -1)
var GRAVITY = 30
var MAX_FALL_SPEED = 1000
var MAX_SPEED = 200
var JUMP_FORCE = 500
var MAXFALLSPEED = 1000
var MAXSPEED = 200
var motion = Vector2()
var jumps = 2
var bullet_speed = 10
var dash = 0
var hit = 0
var block = 0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _enter_tree() -> void:
	set_multiplayer_authority(str(name).to_int()) 

func _physics_process(delta):
	if !is_multiplayer_authority(): return
	$Camera2D.enabled = true
	
	dash -= 1
	motion.y += GRAVITY * delta
	
	if dash <= 0 and not(Input.is_action_pressed("ui_right")):
		MAX_SPEED = 200
	hit -= 1
	block -= 1

	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		if dash <= 0:
			dash = 20
		else:
			MAX_SPEED = 350
			
	if motion.y > MAX_FALL_SPEED:
		motion.y = MAX_FALL_SPEED
	
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.flip_h = false
		if is_on_floor():
			$AnimatedSprite2D.play("run")
		motion.x = MAX_SPEED
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.flip_h = true
		if is_on_floor():
			$AnimatedSprite2D.play("run")
		motion.x = -MAX_SPEED
	elif Input.is_action_pressed("P1normHit"):
		$AnimatedSprite2D.play("hit1")
#	elif Input.is_action_pressed("block"):
#		$AnimatedSprite.play("block")
	if not is_on_floor():
		velocity.y += gravity * delta
		if block < 1:
			$AnimatedSprite2D.play("jump")
	else:
		if is_on_floor():
			$AnimatedSprite2D.play("idle")
		motion.x = 0
	
	motion = motion.slide(UP)  
	
	if is_on_floor():
		jumps = 2
	else:
		$AnimatedSprite2D.play("jump")

	if Input.is_action_just_pressed("P1normHit"):
		if hit < 0:
			$AnimatedSprite2D.play("punch")
			hit = 20
		elif hit < 15:
			pass
			# $AnimatedSprite2D.play("hit2")

	# if Input.is_action_just_pressed("special"):
	# 	block = 30
	# 	$AnimatedSprite2D.play("block")

	if Input.is_action_just_pressed("ui_accept") and jumps > 0:
		$AnimatedSprite2D.play("jump")
		velocity.y = JUMP_VELOCITY
		jumps -= 1
		motion.y = -JUMP_FORCE

func _reset_jump():
	JUMP_FORCE = 500 
	if is_on_floor() and Input.get_axis("ui_left", "ui_right") == 0:
		if hit < 1 or block < 1:
			$AnimatedSprite2D.play("idle")

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if is_on_floor():
			if hit < 1:
				$AnimatedSprite2D.play("run")
				if Input.is_action_pressed("ui_left"):
					$AnimatedSprite2D.flip_h = true
				if Input.is_action_pressed("ui_right"):
					$AnimatedSprite2D.flip_h = false
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
