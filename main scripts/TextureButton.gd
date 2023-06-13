extends TextureButton
signal hovr
signal nothovr
func _ready():
	connect("mouse_entered", Callable(self, "_on_button_hover"))
	connect("mouse_exited", Callable(self, "_on_button_hover_off"))
	connect("pressed", Callable(self, "button_pressed"))
	set_process(false)
	

func _on_button_hover():
	emit_signal("hovr")

func _on_button_hover_off():
	emit_signal("nothovr")


func button_pressed():
	get_tree().change_scene_to_file("res://main scenes/alt_main_menu.tscn")


func _on_host_pressed():
	pass # Replace with function body.
