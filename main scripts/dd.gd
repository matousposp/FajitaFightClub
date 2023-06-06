extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
	
	if Input.is_action_pressed("Paused"):
		visible = true
		get_tree().paused = true


func _on_resume_pressed():
	visible = false
	get_tree().paused = false


func _on_menuu_pressed():
	get_tree().change_scene_to_file("res://main scenes/alt_main_menu.tscn")
