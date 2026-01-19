extends Area2D

@export var speed = 100

var initial_velocity : Vector2 = Vector2.ZERO

var velocity : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2(speed, 0).rotated(rotation) + initial_velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#position += Vector2(speed, 0).rotated(rotation) * delta
	position += velocity * delta
