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
var action = ""
var p1 = PlayerData.p1 == "tim"
var kbpercent = 0
var stun = 0
var respawn = 0
var lives =3

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	respawn -=  1
	if respawn > 0:
		velocity.x = 0
		velocity.y = 0
		position.x = 600
		position.y = 0
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
		if block < 1 and (not(freefall) or velocity.y > 0):
			$AnimatedSprite2D.play("jump")
	else:
		specDone = false
		freefall = false
		jumps = 2
	#jab and aerials
	if p1:
		if Input.is_action_just_pressed("P1normHit") and is_on_floor():
			action = "jab"
			if hit < 0:
				$hitbox/AnimationPlayer.play("hit1")
				$AnimatedSprite2D.play("hit1")
				hit = 20
			elif hit < 15:
				$hitbox/AnimationPlayer.play("hit2")
				$AnimatedSprite2D.play("hit2")
	else:
		if Input.is_action_just_pressed("P2normHit") and is_on_floor():
			action = "jab"
			if hit < 0:
				$hitbox/AnimationPlayer.play("hit1")
				$AnimatedSprite2D.play("hit1")
				hit = 20
			elif hit < 15:
				$hitbox/AnimationPlayer.play("hit2")
				$AnimatedSprite2D.play("hit2")
	#specials
	if p1:
		if Input.is_action_just_pressed("P1special") and Input.get_axis("P1left", "P1right") == 0 and Input.get_axis("P1up", "P1down") == 0 and not(specDone) and not(freefall) and block < 10:
			action = "neutralSpecial"
			velocity.x = 0
			velocity.y = 0
			block = 15
			specDone = true
			$hitbox/AnimationPlayer.play("neutralSPec")
			$AnimatedSprite2D.play("block")
		if Input.is_action_just_pressed("P1special") and Input.get_axis("P1left", "P1right") != 0 and Input.get_axis("P1up", "P1down") == 0 and not(specDone) and block < 10:
			action = "sideSpecial"
			velocity.x = 0
			velocity.y = 0
			block = 15
			specDone = true
			$hitbox/AnimationPlayer.play("sideSpec")
			$AnimatedSprite2D.play("sideSpec")
		if Input.is_action_just_pressed("P1special") and Input.get_axis("P1up", "P1down") == -1  and not(freefall) and block < 10:
			action = "upSpecial"
			velocity.y = -500
			freefall = true
			specDone = true
			$AnimatedSprite2D.play("upSpec")
		if Input.is_action_just_pressed("P1special") and Input.get_axis("P1up", "P1down") == 1  and not(freefall) and not(specDone) and block < 10:
			action = "downSpecial"
			var laser_direction = self.global_position.direction_to(Vector2(position.x+(50)*direct,position.y))
			laser(laser_direction) 
			freefall = true
			specDone = true
			block = 30
			$AnimatedSprite2D.play("downSpec")
	else:
		if Input.is_action_just_pressed("P2special") and Input.get_axis("P2left", "P2right") == 0 and Input.get_axis("P2up", "P2down") == 0 and not(specDone) and not(freefall) and block < 10:
			action = "neutralSpecial"
			velocity.x = 0
			velocity.y = 0
			block = 15
			specDone = true
			$hitbox/AnimationPlayer.play("neutralSPec")
			$AnimatedSprite2D.play("block")
		if Input.is_action_just_pressed("P2special") and Input.get_axis("P2left", "P2right") != 0 and Input.get_axis("P2up", "P2down") == 0 and not(specDone) and block < 10:
			action = "sideSpecial"
			velocity.x = 0
			velocity.y = 0
			block = 15
			specDone = true
			$hitbox/AnimationPlayer.play("sideSpec")
			$AnimatedSprite2D.play("sideSpec")
		if Input.is_action_just_pressed("P2special") and Input.get_axis("P2up", "P2down") == -1  and not(freefall) and block < 10:
			action = "upSpecial"
			velocity.y = -500
			freefall = true
			specDone = true
			$AnimatedSprite2D.play("upSpec")
		if Input.is_action_just_pressed("P2special") and Input.get_axis("P2up", "P2down") == 1  and not(freefall) and not(specDone) and block < 10:
			action = "downSpecial"
			var laser_direction = self.global_position.direction_to(Vector2(position.x+(50)*direct,position.y))
			laser(laser_direction) 
			freefall = true
			specDone = true
			block = 30
			$AnimatedSprite2D.play("downSpec")

	if p1:
		if Input.is_action_just_pressed("P1jump") and jumps > 0:
			action = "jump"
			$AnimatedSprite2D.play("kick")
			if hit < 1 and block < 1:
				if Input.is_action_pressed("P1left"):
					$AnimatedSprite2D.flip_h = true
				if Input.is_action_pressed("P1right"):
					$AnimatedSprite2D.flip_h = false
			velocity.y = JUMP_VELOCITY
			jumps -= 1
			specDone = false
		if is_on_floor() and Input.get_axis("P1left", "P1right") == 0:
			if hit < 1 and block < 1:
				action = "idle"
				$AnimatedSprite2D.play("idle")
	else:
		if Input.is_action_just_pressed("P2jump") and jumps > 0:
			action = "jump"
			$AnimatedSprite2D.play("kick")
			if hit < 1 and block < 1:
				if Input.is_action_pressed("P2left"):
					$AnimatedSprite2D.flip_h = true
				if Input.is_action_pressed("P2right"):
					$AnimatedSprite2D.flip_h = false
			velocity.y = JUMP_VELOCITY
			jumps -= 1
			specDone = false
		if is_on_floor() and Input.get_axis("P1left", "P1right") == 0:
			if hit < 1 and block < 1:
				action = "idle"
				$AnimatedSprite2D.play("idle")
	if p1:
		var direction = Input.get_axis("P1left", "P1right")
		if direction:
			if is_on_floor():
				if hit < 1 and block < 1:
					action = "run"
					$AnimatedSprite2D.play("run")
					if Input.is_action_pressed("P1left"):
						$AnimatedSprite2D.flip_h = true
					if Input.is_action_pressed("P1right"):
						$AnimatedSprite2D.flip_h = false
			if action == "neutralSpecial" or action == "sideSpecial":
				velocity.x = 0
			else:
				velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		var direction = Input.get_axis("P2left", "P2right")
		if direction:
			if is_on_floor():
				if hit < 1 and block < 1:
					action = "run"
					$AnimatedSprite2D.play("run")
					if Input.is_action_pressed("P2left"):
						$AnimatedSprite2D.flip_h = true
					if Input.is_action_pressed("P2right"):
						$AnimatedSprite2D.flip_h = false
			if action == "neutralSpecial" or action == "sideSpecial":
				velocity.x = 0
			else:
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

func _on_hitbox_attack(pos, hitstun, percent, hkb, vkb):
	kbpercent += percent
	velocity.x = hkb * (pos.x-position.x)/abs(pos.x-position.x)
	velocity.y = vkb
	velocity.x *= 1+0.2*kbpercent*0.2*percent
	velocity.y *= 1+0.1*kbpercent*0.1*percent
	stun = hitstun




func _on_hurtbox_laserhit(pos, hitstun, percent, hkb, vkb):
	kbpercent += percent
	velocity.x = hkb * (pos.x-position.x)/abs(pos.x-position.x)
	velocity.y = vkb
	velocity.x *= 1+0.2*kbpercent*0.2*percent
	velocity.y *= 1+0.1*kbpercent*0.1*percent
	stun = hitstun

func _on_borders_body_entered(body):
	if body.is_in_group("char"):
		lives -= 1
		respawn  = 180
		kbpercent = 0
		position.x = 600
		position.y = 0

func projHit(pos, hitstun, percent, hkb, vkb):
	kbpercent += percent
	velocity.x = hkb * (pos.x-position.x)/abs(pos.x-position.x)
	velocity.y = vkb
	velocity.x *= 1+0.2*kbpercent*0.2*percent
	velocity.y *= 1+0.1*kbpercent*0.1*percent
	stun = hitstun
