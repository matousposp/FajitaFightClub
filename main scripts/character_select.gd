extends Node2D

signal start

var mike = preload("res://Multiplayer/scenes/player.tscn")
var selectedChars = 0
var player1 = false
var player2 = false
var player1Char = null
var player2Char = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selectedChars == 2:
		emit_signal("start")
	
	if player1 && get_node("selectionBTN").is_pressed():
		player1Char = mike
		print("mike")
	elif player1 && get_node("selectionBTN2").is_pressed():
		pass
