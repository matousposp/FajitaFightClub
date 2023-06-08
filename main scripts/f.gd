extends TextureRect
signal o
signal n
signal click
func _ready():
	set_process_input(true)




func _on_mouse_entered():
	emit_signal("o")



func _on_mouse_exited():
	emit_signal("n")


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var mouse_pos = event.position
			if rect_contains(mouse_pos):
				emit_signal("click")

func rect_contains(point: Vector2) -> bool:
	var rect_rect = Rect2(Vector2.ZERO, texture.get_size()) # Use Vector2.ZERO as the local position
	return rect_rect.has_point(point)


func _on_click():
	get_tree().change_scene_to_file("res://main scenes/character_select.tscn")
