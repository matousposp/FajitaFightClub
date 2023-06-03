extends CheckButton
var btnOn = false

func _ready():
	get_parent().player2 = true


func _on_toggled(button_pressed):
	get_parent().player1 = true
	get_parent().player2 = false
	btnOn = true
