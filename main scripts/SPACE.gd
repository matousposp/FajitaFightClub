extends Button
signal showSpaceMap
signal spaceChosen
func _ready():
	connect("mouse_entered", Callable(self, "_on_button_hover"))
	connect("mouse_exited", Callable(self, "_on_button_hover_off"))
	connect("pressed", Callable(self, "button_pressed"))
	set_process(false)
	

func _on_button_hover():
	pass

func _on_button_hover_off():
	pass

func button_pressed():
	emit_signal("showSpaceMap")
