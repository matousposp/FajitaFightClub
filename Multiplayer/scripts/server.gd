extends Control

const port = 7777
var peer = ENetMultiplayerPeer.new()
var ipad : String
var player = 1

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
	add_player(multiplayer.get_unique_id())
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(remove_player)
#	multiplayer.server_disconnected.connect(server_delete)
	hide()
	
func add_player(id):
	print(str(id) + " has joined!")

func remove_player(id):
	print(str(id) + " has left!")
	
#func server_delete():
#	print("Host has left!")

func _on_copy_pressed() -> void:
	DisplayServer.clipboard_set($IP.text)
