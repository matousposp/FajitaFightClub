extends Node2D
signal title
var fight = false
# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerData.mode = ""
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

func _process(delta):
	if PlayerData.mode == "fight":
		fight = true
	if $CharacterSelect.skew < 0 and fight:
		$CharacterSelect.skew += 0.1
	if fight and abs($CharacterSelect.skew) < 0.1:
		$CharacterSelect.skew = 0
