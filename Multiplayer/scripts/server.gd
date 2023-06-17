extends Control

const port = 7777
var peer = ENetMultiplayerPeer.new()
var ipad : String

#var randMap = RandomNumberGenerator.new()
var player = preload("res://players/Tim.tscn" )

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
#	var my_random_number = randMap.randi_range(1, 2)
	if OS.get_name() == "Android":
		peer.set_bind_ip(ipad)
	peer.create_server(port) 
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(remove_player)
#	multiplayer.server_disconnected.connect(server_delete)
	add_player(multiplayer.get_unique_id())
#	if my_random_number == 1:
#		get_tree().change_scene_to_file("res://tmaps/grassmap.tscn")
#	elif my_random_number == 2:
#		get_tree().change_scene_to_file("res://tmaps/spacemap.tscn")
	hide()	

func add_player(id):
	var player_new = player.instantiate()
	player_new.name = str(id)
	print("Player " + str(id) + " has joined!")
	#player_new_scale = Vector2(2,2)
	get_parent().get_node("Player_Spawn").add_child(player_new)

func remove_player(id):
	print(str(id) + " has left!")
	
func server_delete():
	pass

func _on_copy_pressed() -> void:
	DisplayServer.clipboard_set(%IP.text)
