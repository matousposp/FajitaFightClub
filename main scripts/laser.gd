extends Area2D

var direction = Vector2(1,0)

var SPEED: int = 400

func _physics_process(delta):
	direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta
	
func destroy():
	queue_free()


func _on_body_entered(body):
	pass # Replace with function body.



func _on_area_entered(area):
	pass # Replace with function body.
