extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_fight_onhover():
	$AnimationPlayer.play("1")


func _on_fight_hoveroff():
	$AnimationPlayer.play("2")
