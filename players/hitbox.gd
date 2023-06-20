extends Area2D

signal attack(target,hitstun, percent, kb, setkb)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	if not(area.is_in_group("mike")):
		if get_parent().action == "bAir":
			emit_signal("attack",position,30,15,-50,-70)
		if get_parent().action == "fAir":
			emit_signal("attack",position,20,12,50,-70)
		if get_parent().action == "uAir":
			emit_signal("attack",position,20,11,0,-140)
		if get_parent().action == "dAir":
			emit_signal("attack",position,20,18,30,140)
		if get_parent().action == "nAir":
			emit_signal("attack",position,20,10,0,-100)
		if get_parent().action == "jab":
			emit_signal("attack",position,20,2,0,30)
		if get_parent().action == "jab2":
			emit_signal("attack",position,20,5,60,-50)
		if get_parent().action == "fTilt":
			emit_signal("attack",position,20,9,80,0)
		if get_parent().action == "dTilt":
			emit_signal("attack",position,20,8,40,-70)
		if get_parent().action == "neutralSpecial":
			emit_signal("attack",position,20,16,70,-70)
		if get_parent().action == "sideSpecial":
			emit_signal("attack",position,20,13,40,-30)
		if get_parent().action == "upSpecial":
			emit_signal("attack",position,20,12,20,-130)
		
func _on_hitbox_attack(pos, hitstun, percent, hkb, vkb):
	print("buids")
