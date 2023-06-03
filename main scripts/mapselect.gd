extends Node2D
var spacemap = null
var grassmap = preload("res://tmaps/grassmap.tscn")
var chosenMap = null

func _ready():
	pass
	
func _physics_process(delta):
	pass


func _on_grassland_grass_chosen():
	chosenMap = grassmap
	print("you chose the grassland map")



func _on_space_space_chosen():
	print("you chose the space map")
	chosenMap = spacemap
