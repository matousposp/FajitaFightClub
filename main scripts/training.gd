extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerData.p1 = "mike"
	$Mike.p1 = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
