extends ColorRect
var characterOne = preload("res://Multiplayer/scenes/player.tscn")
signal onhov
signal hovoff
func _ready():
	connect("mouse_entered", Callable(self, "_on_button_hover"))
	connect("mouse_exited", Callable(self, "_on_button_hover_off"))
	set_process_input(true)

func _on_button_hover():
	emit_signal("onhov")

func _on_button_hover_off():
	emit_signal("hovoff")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if rect_contains(event.position):
				pass

func rect_contains(point: Vector2) -> bool:
	var global_position = get_global_position()
	var rect_rect = Rect2(global_position, get_size())
	return rect_rect.has_point(point)

# Instantiate the character displayed on this ColorRect
# Then, if this is clicked on assign the preloaded characterOne var to global variable which needs to be made
# Then, this global variable will be used in the actual game scene to instance the specified character node and effectively spawn it in
