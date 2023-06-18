extends Node2D
var spacemap = preload("res://tmaps/rockmap.tscn")
var grassmap = preload("res://tmaps/grassmap.tscn")
var lavamap = preload("res://tmaps/lavamap.tscn")
var rockmap = preload("res://tmaps/spacemap.tscn")
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
		get_tree().change_scene_to_file("res://tmaps/rockmap.tscn")
	if chosenMap == lavamap:
		PlayerData.map = "lavamap"
		get_tree().change_scene_to_file("res://tmaps/lavamap.tscn")
	if chosenMap == rockmap:
		PlayerData.map = "rockmap"
		get_tree().change_scene_to_file("res://tmaps/spacemap.tscn")


func _on_lava_lava_chosen():
	print("you chose lava map")
	chosenMap = lavamap


func _on_grass_hide_1():
	$Spacemap.visible = false
	$Lm.visible = false
	$Rm.visible = false


func _on_spacemap_hide():
	$Grass.visible = false
	$Lm.visible = false
	$Rm.visible = false


func _on_lm_hide_2():
	$Spacemap.visible = false
	$Grass.visible = false
	$Rm.visible = false


func _on_rock_rock_chosen():
	print("you chose rock map")
	chosenMap = rockmap


func _on_rm_hide_4():
	$Spacemap.visible = false
	$Grass.visible = false
	$Lm.visible = false
