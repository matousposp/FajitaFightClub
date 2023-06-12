extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print(PlayerData.p1)
	print(PlayerData.p2)
	if PlayerData.p1 == "mike":
		$Mike.position.x = 333
	if PlayerData.p1 == "tim":
		$char.position.x = 333
	if PlayerData.p2 == "mike":
		$Mike.position.x = 795
	if PlayerData.p2 == "tim":
		$char.position.x = 795


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
