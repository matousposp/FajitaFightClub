extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_p_1_onhov():
	$AnimationPlayer.play("1")


func _on_p_1_hovoff():
	$AnimationPlayer.play("2")
