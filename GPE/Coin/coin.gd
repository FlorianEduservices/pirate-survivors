extends Area2D

var is_collected : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_collected == true and $CollectCoinSFX.playing == false:
		queue_free()

func _on_body_entered(body: Node2D):
	if body.has_method("update_score") and is_collected == false:
		body.update_score(100)
		$AnimatedSprite2D.hide()
		$CollectCoinSFX.play()
		is_collected = true
		#queue_free()
