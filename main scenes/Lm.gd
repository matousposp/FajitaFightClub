extends Sprite2D
signal hide2

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_lava_showlavalmap():
	visible = true
	z_index = get_parent().get_child_count() - 1
	emit_signal("hide2")
