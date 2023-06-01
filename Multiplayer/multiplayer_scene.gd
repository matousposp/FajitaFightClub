extends Node

var network_peer: ENetMultiplayerPeer

func _ready():
	if Engine.has_singleton("ENetMultiplayerPeer"):
		network_peer = ENetMultiplayerPeer.new()
	else:
		print("ENetMultiplayerPeer not available.")

func set_network_peer(peer: ENetMultiplayerPeer):
	if Engine.has_singleton("NetworkedMultiplayerENet"):
		var network_peer_enet = Engine.get_singleton("NetworkedMultiplayerENet")
		network_peer_enet.set_peer(peer)
	else:
		print("NetworkedMultiplayerENet not available.")

func _onHostButtonPressed():
	var ip: String = $IPInput.text
	var port: int = $PortInput.text.to_int()

	if validateIP(ip) and validatePort(port):
		if network_peer != null:
			network_peer.transfer_channel = ENetMultiplayerPeer.TRANSFER_MODE_RELIABLE

			network_peer.create_server(port)
			set_network_peer(network_peer)
			print("Server created on port", port)
		else:
			print("ENetMultiplayerPeer not available.")
	else:
		print("Invalid IP or port.")

func _onJoinButtonPressed():
	var ip: String = $IPInput.text
	var port: int = $PortInput.text.to_int()

	if validateIP(ip) and validatePort(port):
		if network_peer != null:
			network_peer.transfer_channel = ENetMultiplayerPeer.TRANSFER_MODE_RELIABLE

			network_peer.create_client(ip, port)
			set_network_peer(network_peer)
			print("Joining server at", ip, "port", port)
		else:
			print("ENetMultiplayerPeer not available.")
	else:
		print("Invalid IP or port.")

func validateIP(ip: String) -> bool:
	var parts: Array = ip.split(".")
	
	if parts.size() != 4:
		return false
	
	for part in parts:
		var value: int = part.to_int()
		
		if value < 0 or value > 255:
			return false
	
	return true

func validatePort(port: int) -> bool:
	return port >= 0 and port <= 65535
