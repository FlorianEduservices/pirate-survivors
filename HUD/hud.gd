extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_parent()
	
	var player_score = player.score
	$ScoreLabel.text = "Score: " + str(player_score)
	_update_life(player.current_life, player.max_life)

func _update_life(current_life : float, life_max : float):
	$LifeProgressBar.max_value = life_max
	$LifeProgressBar.value = current_life
	# same as:
	#var life_percentage = current_life / life_max * 100
	#$LifeProgressBar.value = life_percentage
	
