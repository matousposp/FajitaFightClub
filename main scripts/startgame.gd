extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_grassland_show_grass_map():
	visible = true


func _on_space_show_space_map():
	visible = true
