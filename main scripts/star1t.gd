extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
		connect("pressed", Callable(self, "button_pressed"))
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func button_pressed():
	get_tree().change_scene_to_file("res://main scenes/mapselect.tscn")
