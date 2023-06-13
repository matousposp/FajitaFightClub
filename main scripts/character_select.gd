extends Node2D

signal start
var tim = preload("res://assets/1.jpg")
var mike = preload("res://Multiplayer/scenes/player.tscn")
var char = preload("res://assets/2.jpg")
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
		player2 = true
		print("player 1 chose mike")
	elif player1 && get_node("selectionBTN2").is_pressed():
		$p1indicator2.visible = true
		player1 = false
		player1Char = tim
		player2 = true
		PlayerData.p1 = "tim"
		print("player 1 chose tim")
	elif player1 && get_node("selectionBTN3").is_pressed():
		$p1indicator3.visible = true
		player1 = false
		player1Char = char
		player2 = true
		PlayerData.p1 = "char"
		print("player 1 chose char")
	
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
	elif player2 && get_node("selectionBTN3").is_pressed() && player1Char != char:
		$p2indicator3.visible = true
		player2Char = char
		PlayerData.p2 = "char"
		print("player 2 chose char")
