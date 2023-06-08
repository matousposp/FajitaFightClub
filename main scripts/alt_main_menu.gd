extends Node2D
signal title

# Called when the node enters the scene tree for the first time.
func _ready():
	$T14/AnimationPlayer.play("1")
	$T16/AnimationPlayer.play("1")
	$T3/AnimationPlayer.play("1")
	$T4/AnimationPlayer.play("loop")
	$T11/AnimationPlayer.play("1")
	$T9/AnimationPlayer.play("1")
	$T6/AnimationPlayer.play("1")
	$T8/AnimationPlayer.play("1")
	$T2/AnimationPlayer.play("1")
	$T13/AnimationPlayer.play("1")
	$Label/AnimationPlayer.play("fade")
	
func _process(delta):
	if Input.is_action_pressed("Space"):
		get_tree().change_scene_to_file("res://main scenes/aftermenu.tscn")
	
