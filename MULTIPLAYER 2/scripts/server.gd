extends Control

const port = 7777
var peer = ENetMultiplayerPeer.new()
var ipad : String

var player = preload("res://MULTIPLAYER 2/scenes/Tim.tscn")

func _ready() -> void:
	if OS.get_name() == "Windows":
		ipad = IP.get_local_addresses()[3]
	elif OS.get_name( )== "Android":
		ipad = IP.get_local_addresses()[0]
	else:
		ipad = IP.get_local_addresses()[3]
	for ip in IP.get_local_addresses():
		if ip.begins_with("192.168.") or ip.begins_with("10."):
			ipad = ip
	$IP.text = ipad 

func _on_join_pressed():
	if $Join_IP.text == "":
		print("ENTER AN IP")
		return
	peer.create_client($Join_IP.text, port)
	multiplayer.multiplayer_peer = peer
	hide()


func _on_host_pressed():
	if OS.get_name() == "Android":
		peer.set_bind_ip(ipad)
	peer.create_server(port)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(remove_player)
	add_player(multiplayer.get_unique_id())
#	multiplayer.server_disconnected.connect(server_delete)
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

func _on_copy_pressed():
	DisplayServer.clipboard_set(%IP.text)
