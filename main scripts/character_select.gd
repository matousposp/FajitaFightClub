extends Node2D
signal start
var selectedChars = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selectedChars == 2:
		emit_signal("start")
