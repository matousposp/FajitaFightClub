extends Button


var action: String = "ui_up"

func _ready():
	InputMap.set_action_enabled(action, false)
	display_key()

func display_key():
	text = "%s" % InputMap.get_action_list(action)[0].as_text()

func _on_Button_toggled(button_pressed: bool):
	InputMap.set_action_enabled(action, button_pressed)
	if button_pressed:
		text = "..."
	else:
		display_key()

func _unhandled_key_input(event: InputEvent):
	remap_key(event)
	pressed = false

func remap_key(event: InputEvent):
	InputMap.erase_action_events(action)
	InputMap.add_action_event(action, event)

	text = "%s" % event.as_text()
