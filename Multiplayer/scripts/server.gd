extends Control

const port = 7777
var peer = ENetMultiplayerPeer.new()
var ipad : String

var player = preload("res://players/Vlad.tscn")

func _ready() -> void:
	if OS.get_name() == "Windows":
		ipad = IP.get_local_addresses()[3]
	elif OS.get_name() == "Android":
		ipad = IP.get_local_addresses()[0]
	else:
		ipad = IP.get_local_addresses()[3]
	
	for ip in IP.get_local_addresses():
		if ip.begins_with("192.168.") or ip.begins_with("10."):
			ipad = ip
	$IP.text = ipad
	
func _on_join_pressed() -> void:
	if $Join_IP.text == "":
		print("PUT AN IP ADDRESS")
		return
	peer.create_client($Join_IP.text, port)
	multiplayer.multiplayer_peer = peer
	hide()
	
func _on_host_pressed() -> void:
	if OS.get_name() == "Android":
		peer.set_bind_ip(ipad)
	peer.create_server(port) 
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(remove_player)
	add_player(multiplayer.get_unique_id())
	hide()	

func add_player(id):
	var player_new = player.instantiate()
	player_new.name = str(id)
	print("Player " + str(id) + " has joined!")
	get_parent().get_node("Player_Spawn").add_child(player_new)

func remove_player(id):
	print(str(id) + " has left!")
	
func server_delete():
	pass

func _on_copy_pressed() -> void:
	DisplayServer.clipboard_set(%IP.text)

#
#func _on_selection_btn_pressed():
#	player = preload("res://players/Mike.tscn")
#
#
#func _on_selection_btn_2_pressed():
#	player = preload("res://players/Tim.tscn")
#
#
#func _on_selection_btn_3_pressed():
#	player = preload("res://players/char.tscn")
