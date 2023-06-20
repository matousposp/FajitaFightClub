extends Area2D

var direction = Vector2(1,0)

var SPEED: int = 400

func _physics_process(delta):
	direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta
	
func destroy():
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("char"):
		body.projHit(position, 40, 30, -30, -30)



func _on_area_entered(area):
	if area.is_in_group("hitbox"):
		queue_free()
