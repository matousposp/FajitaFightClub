extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_online_hovoff():
	$AnimationPlayer.play("2")


func _on_online_onnh():
	$AnimationPlayer.play("1")
