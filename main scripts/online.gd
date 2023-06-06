extends Button
signal onnh
signal hovoff
func _ready():
	connect("mouse_entered", Callable(self, "_on_button_hover"))
	connect("mouse_exited", Callable(self, "_on_button_hover_off"))
	connect("pressed", Callable(self, "button_pressed"))
	set_process(false)
	

func _on_button_hover():
	# get_node("AnimationPlayer").play("wide")
	get_node("AnimationPlayer").play("a")
	emit_signal("onnh")

func _on_button_hover_off():
	get_node("AnimationPlayer").play("d")
	emit_signal("hovoff")

func button_pressed():
	get_tree().change_scene_to_file("res://Multiplayer/scenes/server.tscn")
