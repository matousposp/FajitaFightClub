extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_o_r():
	visible = true


func _on_o_t():
	visible = false
