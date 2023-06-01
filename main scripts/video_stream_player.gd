extends VideoStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x;

# Called when the node enters the scene tree for the first time.
func _ready():
	x = 435

func _physics_process(delta):
	x -= 1
	if x < 0:
		get_tree().change_scene_to_file("res://main scenes/alt_main_menu.tscn")
