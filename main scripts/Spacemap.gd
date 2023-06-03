extends Sprite2D
signal hide

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_space_show_space_map():
	visible = true
	z_index = get_parent().get_child_count() - 1
	emit_signal("hide")


func _on_grass_hide_1():
	visible = false
