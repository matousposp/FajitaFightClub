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
		emit_signal("attack",PlayerData.p2,20,30,2,2)
		
func _on_hitbox_attack(target, hitsun, percent, kb, setkb):
	print("buids")
