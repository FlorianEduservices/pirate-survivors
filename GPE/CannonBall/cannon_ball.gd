extends Area2D

@export var speed = 100

var initial_velocity : Vector2 = Vector2.ZERO

var velocity : Vector2
var instigator : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2(speed, 0).rotated(rotation) + initial_velocity
	$LifetimeTimer.timeout.connect(_on_lifetime_timeout)
	body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#position += Vector2(speed, 0).rotated(rotation) * delta
	position += velocity * delta

func _on_lifetime_timeout():
	queue_free()

func _on_body_entered(body : Node2D):
	if body != instigator:
		body.queue_free()
		queue_free()
