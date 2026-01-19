extends Area2D

@export var speed = 100

var initial_velocity : Vector2 = Vector2.ONE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2(speed, 0).rotated(rotation) * delta
	#position += initial_velocity * delta
