extends Control

var percent = 0
var lives = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if percent > 999:
		percent = 999
	$RichTextLabel.text = str(percent)+"%"
	$RichTextLabel2.text = str(lives)
