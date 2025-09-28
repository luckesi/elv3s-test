extends CharacterBody2D
func _pyshics_process(_delta: float) -> void:
	if velocity.x:
		velocity.x *= 0.995

	if velocity.y:
		velocity.y *= 0.995

	if velocity.y and velocity.x:
		velocity.x *= 0.995
		velocity.x *= 0.995
	move_and_slide()
