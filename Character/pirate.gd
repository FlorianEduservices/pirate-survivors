extends RigidBody2D

@export var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	var player_nodes = get_tree().get_nodes_in_group("Player")
	if player_nodes.size() > 0:
		var player = player_nodes[0]
		
		# compute direction to player
		var direction_to_player = player.position - position
		
		var distance_to_player = direction_to_player.length()
		if distance_to_player > 300:
			# Transform direction to force
			var force = direction_to_player.normalized() * speed
			apply_central_force(force)
			# Rotate the ship to face its moving direction
			#rotation = force.angle()
		rotation = direction_to_player.angle()
