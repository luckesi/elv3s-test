extends CharacterBody2D

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var texture: Sprite2D = $Texture
@export_category("Player Stats")
@export var SPEED: float = 110
var push_force: float = 0.75
var is_pushing: bool = false

#Variável da direção
var current_dir: String = "none"

#Função da física
func _physics_process(_delta: float) -> void:
	move ()
	animate()
	is_pushing = false

#Função de movimento
func move () -> void: 
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	_push_objects()
	move_and_slide ()

#Função da empurrada
func _push_objects():
	var lastCollision = get_last_slide_collision()

	if lastCollision:
		var collider = lastCollision.get_collider()

		if "Barril" in collider.name:
			var pushDirection = (collider.global_position - global_position).normalized()

			var pushOnSide = abs(pushDirection.y) < 0.5
			
			var pushOnTop = abs(pushDirection.x) < 0.5

			if pushOnTop or pushOnSide:
				is_pushing = true
				var pushVelocity = Vector2(push_force * pushDirection)
				collider.velocity += pushVelocity

#Função das animações
func animate () -> void:
	#Função de andar
	if velocity.x != 0 or velocity.y != 0:
		if Input.is_action_just_pressed("ui_left"):
			texture.flip_h = false
			current_dir = "left"
			animation.play("walkSIDE")

		elif Input.is_action_just_pressed("ui_right"):
			texture.flip_h = true
			current_dir = "right"
			animation.play("walkSIDE")

		elif Input.is_action_pressed("ui_up"):
			texture.flip_h = false
			current_dir = "up"
			animation.play("walkBACK")

		elif Input.is_action_pressed("ui_down"):
			texture.flip_h = false
			current_dir = "down"
			animation.play("walkFRONT")

	#Animação do idle
	else:
		if current_dir == "left":
			animation.play("idleSIDE")
			texture.flip_h = false

		if current_dir == "right":
			animation.play("idleSIDE")
			texture.flip_h = true
			
		if current_dir == "up":
			animation.play("idleBACK")
			texture.flip_h = false
		
		if current_dir == "down":
			animation.play("idleFRONT")
			texture.flip_h = false
