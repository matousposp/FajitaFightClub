extends Control

var current_button : Button

@onready var button_01 : Button = $Button_01
@onready var button_02 : Button = $Button_02
@onready var button_03 : Button = $Button_03
@onready var label_01 : Label = $Label_01
@onready var label_02 : Label = $Label_02
@onready var label_03 : Label = $Label_03
@onready var info_panel : PanelContainer = $PanelContainer

func _ready() -> void:
	# Connect the buttons pressed signal:
	button_01.pressed.connect(_on_button_pressed.bind(button_01))
	button_02.pressed.connect(_on_button_pressed.bind(button_02))
	button_03.pressed.connect(_on_button_pressed.bind(button_03))
	
	_update_labels()
	
	info_panel.hide() 
	

func _on_button_pressed(button: Button) -> void:
	current_button = button 
	info_panel.show() 

func _input(event: InputEvent) -> void:
	if !current_button: 
		return
		
	if event is InputEventKey || event is InputEventMouseButton:
		
		
		var all_ies : Dictionary = {}
		for ia in InputMap.get_actions():
			for iae in InputMap.action_get_events(ia):
				all_ies[iae.as_text()] = ia
		
		if all_ies.keys().has(event.as_text()):
			InputMap.action_erase_events(all_ies[event.as_text()])
		
		InputMap.action_erase_events(current_button.name)
		
		InputMap.action_add_event(current_button.name, event)
		
		
		current_button = null
		info_panel.hide() 
		
		_update_labels() 
		
func _update_labels() -> void:

	var eb1 : Array[InputEvent] = InputMap.action_get_events("Button_01")
	if !eb1.is_empty():
		label_01.text = eb1[0].as_text()
	else:
		label_01.text = ""
		
	var eb2 : Array[InputEvent] = InputMap.action_get_events("Button_02")
	if !eb2.is_empty():
		label_02.text = eb2[0].as_text()
	else:
		label_02.text = ""
	
	var eb3 : Array[InputEvent] = InputMap.action_get_events("Button_03")
	if !eb3.is_empty():
		label_03.text = eb3[0].as_text()
	else:
		label_03.text = ""
