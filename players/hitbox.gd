extends Area2D

signal attack(hitstun, percent, kb, setkb)
# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerData.p1 == "tim" or PlayerData.p2 == "tim":
		var hitbox = get_node("hitbox")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	if not(area.is_in_group("mike")):
		print("kys")
		attack.emit(20,30,2,false)
		
