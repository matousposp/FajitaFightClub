extends Node2D
var spacemap = preload("res://tmaps/spacemap.tscn")
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


func _on_button_pressed():
	if chosenMap == grassmap:
		PlayerData.map = "grassmap"
		get_tree().change_scene_to_file("res://tmaps/grassmap.tscn")
	if chosenMap == spacemap:
		PlayerData.map = "spacemap"
		get_tree().change_scene_to_file("res://tmaps/spacemap.tscn")
