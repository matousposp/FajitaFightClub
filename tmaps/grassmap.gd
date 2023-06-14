extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print(PlayerData.p1)
	print(PlayerData.p2)

	$char.position.y = 360
	if PlayerData.p1 == "mike":
		$Mike.position.x = 333
	if PlayerData.p1 == "tim":
		$char.position.x = 333
	if PlayerData.p1 == "char":
		$char.position.x = 333
	if PlayerData.p2 == "mike":
		$Mike.position.x = 795
	if PlayerData.p2 == "tim":
		$char.position.x = 795
	if PlayerData.p2 == "char":
		$char.position.x = 795
	if not(PlayerData.p1 == "mike" or PlayerData.p2 == "mike"):
		$Mike.queue_free()
	if not(PlayerData.p1 == "tim" or PlayerData.p2 == "tim"):
		$char.queue_free()
		pass
	if not(PlayerData.p1 == "char" or PlayerData.p2 == "char"):
		$char.queue_free()
	if not(PlayerData.p1 == "nikkacado" or PlayerData.p2 == "nikkacado"):
		$nikkacado.queue_free()

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
	
