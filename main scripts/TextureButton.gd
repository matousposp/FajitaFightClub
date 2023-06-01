extends TextureButton

func _ready():
	connect("pressed", Callable(self, "button_pressed"))
	set_process(false)
	

func button_pressed():
	get_tree().change_scene_to_file("res://main scenes/alt_main_menu.tscn")
