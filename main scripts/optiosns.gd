extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Paused"):
		if $CanvasLayer.is_visible():
			$CanvasLayer.hide()
			get_tree().paused = false
		else:
			$CanvasLayer.show()
			get_tree().paused = true
