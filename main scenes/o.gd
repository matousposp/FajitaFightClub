extends TextureRect
signal r
signal t
func _ready():
	pass
	
	


func _on_mouse_entered():
	emit_signal("r")


func _on_mouse_exited():
	emit_signal("t")
