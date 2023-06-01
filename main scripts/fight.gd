extends Button

func _ready():
	connect("mouse_entered", Callable(self, "_on_button_hover"))
	connect("mouse_exited", Callable(self, "_on_button_hover_off"))
	connect("pressed", Callable(self, "button_pressed"))
	set_process(false)
	

func _on_button_hover():
	get_node("AnimationPlayer").play("a")

func _on_button_hover_off():
	get_node("AnimationPlayer").play("d")

func button_pressed():
	get_tree().change_scene_to_file("res://main scenes/character_select.tscn")
