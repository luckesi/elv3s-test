extends CharacterBody2D

var object_weight:float = 80 # pra mudar a velocidade de empurrar de acordo com o peso do objeto

func _pyshics_process(_delta: float) -> void:
	pass


func _on_hitbox_area_2d_area_entered(area: Area2D) -> void:
	print("OBJECTO HITBOX: ",area)


func _on_hitbox_area_2d_area_exited(_area: Area2D) -> void:
	velocity = Vector2.ZERO

func on_push(push_force: int):
	velocity = (MainCharacter.velocity * push_force )
	move_and_slide()
