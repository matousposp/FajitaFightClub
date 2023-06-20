extends Area2D

signal laserhit(hitstun, percent, hkb, vkb)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_entered(area):
	print("thing")
	if area.is_in_group("hitbox") and not(area.is_in_group("char")):
		emit_signal("laserhit", area.position, 30, 16, 30, -100)
