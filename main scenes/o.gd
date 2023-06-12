extends TextureRect
signal r
signal t
signal c
func _ready():
	pass
	
	


func _on_mouse_entered():
	emit_signal("r")


func _on_mouse_exited():
	emit_signal("t")


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var mouse_pos = event.position
			if rect_contains(mouse_pos):
				emit_signal("c")

func rect_contains(point: Vector2) -> bool:
	var rect_rect = Rect2(Vector2.ZERO, texture.get_size()) 
	return rect_rect.has_point(point)


func _on_c():
	get_tree().change_scene_to_file("res://Multiplayer/scenes/server.tscn")
