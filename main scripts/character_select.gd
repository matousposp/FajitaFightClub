extends Node2D

signal start
var tim = preload("res://assets/1.jpg")
var mike = preload("res://Multiplayer/scenes/player.tscn")
var selectedChars = 0
var player1 = true
var player2 = false
var player1Char = null
var player2Char = null
var p1 = ""
var p2 = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selectedChars == 2:
		emit_signal("start")
	
	if player1 && get_node("selectionBTN").is_pressed():
		$p1indicator.visible = true
		player1 = false
		player1Char = mike
		PlayerData.p1 = "mike"
		print("player 1 chose mike")
	elif player1 && get_node("selectionBTN2").is_pressed():
		$p1indicator2.visible = true
		player1 = false
		player1Char = tim
		PlayerData.p1 = "tim"
		print("player 1 chose tim")
	
	if player2 && get_node("selectionBTN").is_pressed() && player1Char != mike:
		$p2indicator.visible = true
		player2Char = mike
		PlayerData.p2 = "mike"
		print("player 2 chose mike")
	elif player2 && get_node("selectionBTN2").is_pressed() && player1Char != tim:
		$p2indicator2.visible = true
		player2Char = tim
		PlayerData.p2 = "tim"
		print("player 2 chose tim")
