extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var LASER: PackedScene = preload('res://players/projectiles/laser.tscn')

const UP= Vector2(0, -1) 
var GRAVITY= 30
var MAXFALLSPEED= 1000
var MAXSPEED= 200
var motion = Vector2()
var jumps = 2
var bullet_speed = 10
var dash = 0
var hit = 0
var block = 0
var specDone = false
var freefall = false
var direct = false



var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if $AnimatedSprite2D.flip_h:
		direct = -1
	else:
		direct = 1
	#timers
	hit -= 1
	block -= 1
	#if not on floor then play air animation
	if not is_on_floor():
		velocity.y += gravity * delta
		if block < 1:
			$AnimatedSprite2D.play("jump")
	else:
		specDone = false
		freefall = false
		jumps = 2
	#jab and aerials
	if Input.is_action_just_pressed("normHit") and is_on_floor():
			if hit < 0:
				$AnimatedSprite2D.play("hit1")
				hit = 20
			elif hit < 15:
				$AnimatedSprite2D.play("hit2")
	#specials
	if Input.is_action_just_pressed("special") and Input.get_axis("ui_left", "ui_right") == 0 and Input.get_axis("ui_up", "ui_down") == 0 and not(specDone) and not(freefall) and block < 10:
		velocity.x = 0
		velocity.y = 0
		block = 15
		specDone = true
		$AnimatedSprite2D.play("block")
	if Input.is_action_just_pressed("special") and Input.get_axis("ui_left", "ui_right") != 0 and Input.get_axis("ui_up","ui_down") == 0 and not(specDone) and block < 10:
		velocity.x = 0
		velocity.y = 0
		block = 15
		specDone = true
		$AnimatedSprite2D.play("sideSpec")
	if Input.is_action_just_pressed("special") and Input.get_axis("ui_up", "ui_down") == -1  and not(freefall) and block < 10:
		velocity.y = -500
		freefall = true
		specDone = true
		$AnimatedSprite2D.play("upSpec")
	if Input.is_action_just_pressed("special") and Input.get_axis("ui_up", "ui_down") == 1  and not(freefall) and not(specDone) and block < 10:
		var laser_direction = self.global_position.direction_to(Vector2(position.x+(50)*direct,position.y))
		laser(laser_direction) 
		freefall = true
		specDone = true
		block = 30
		$AnimatedSprite2D.play("downSpec")


	if Input.is_action_just_pressed("Space") and jumps > 0:
		$AnimatedSprite2D.play("kick")
		velocity.y = JUMP_VELOCITY
		jumps -= 1
		specDone = false
	if is_on_floor() and Input.get_axis("ui_left", "ui_right") == 0:
		if hit < 1 and block < 1:
			$AnimatedSprite2D.play("idle")

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if is_on_floor():
			if hit < 1 and block < 1:
				$AnimatedSprite2D.play("run")
				if Input.is_action_pressed("ui_left"):
					$AnimatedSprite2D.flip_h = true
				if Input.is_action_pressed("ui_right"):
					$AnimatedSprite2D.flip_h = false
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func laser(laser_direction:Vector2):
	if LASER:
		var laser = LASER.instantiate()
		get_tree().current_scene.add_child(laser)
		laser.global_position = self.global_position
		laser.position.y -= 15
		var laser_rotation = laser_direction.angle()
		laser.rotation = laser_rotation
