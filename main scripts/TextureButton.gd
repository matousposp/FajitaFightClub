extends TextureButton

func _ready():
	connect("mouse_entered", Callable(self, "_on_button_hover"))
	connect("mouse_exited", Callable(self, "_on_button_hover_off"))
	connect("pressed", Callable(self, "button_pressed"))
	set_process(false)
	

func _on_button_hover():
	get_node("AnimationPlayer").play("hover")

func _on_button_hover_off():
	$AnimationPlayer.stop()


func button_pressed():
	get_tree().change_scene_to_file("res://main scenes/alt_main_menu.tscn")
