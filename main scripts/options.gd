extends Button
signal onh
signal hof
func _ready():
	connect("mouse_entered", Callable(self, "_on_button_hover"))
	connect("mouse_exited", Callable(self, "_on_button_hover_off"))
	connect("pressed", Callable(self, "button_pressed"))
	set_process(false)


func _on_button_hover():
	get_node("AnimationPlayer").play("wide")
	# get_node("AnimationPlayer").play("a")
	emit_signal("onh")

func _on_button_hover_off():
	# get_node("AnimationPlayer").play("d")
	emit_signal("hof")

func button_pressed():
	get_tree().change_scene_to_file("res://main scenes/options.tscn")
