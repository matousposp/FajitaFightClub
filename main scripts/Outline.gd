extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_nothovr():
	$AnimationPlayer.play("2")


func _on_texture_button_hovr():
	$AnimationPlayer.play("1")
