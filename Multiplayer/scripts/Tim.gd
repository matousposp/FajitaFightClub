
extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

const UP = Vector2(0, -1)
var GRAVITY = 30
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
	hit -= 1
	block -= 1

	if not is_on_floor():
		velocity.y += gravity * delta
		if block < 1:
			$AnimatedSprite2D.play("jump")
	else:
		jumps = 2

	if Input.is_action_just_pressed("normHit"):
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
