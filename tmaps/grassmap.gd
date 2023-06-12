extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print(PlayerData.p1)
	print(PlayerData.p2)
	$Mike.position.y = 360
	$char.position.y = 360
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
	$p1indicator.position.x = 60
	if PlayerData.p1 == "mike":
		$p1indicator.position.x = $Mike.position.x
		$p1indicator.position.y = $Mike.position.y - 50
	if PlayerData.p1 == "tim":
		$p1indicator.position.x = $char.position.x
		$p1indicator.position.y = $char.position.y - 50
	if PlayerData.p2 == "mike":
		$p2indicator.position.x = $Mike.position.x
		$p2indicator.position.y = $Mike.position.y - 50
	if PlayerData.p2 == "tim":
		$p2indicator.position.x = $char.position.x
		$p2indicator.position.y = $char.position.y - 50
