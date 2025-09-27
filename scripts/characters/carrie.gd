extends CharacterBody2D

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var texture: Sprite2D = $Texture
@export_category("Player Stats")
@export var SPEED: float = 150

var current_dir: String = "none"

func _physics_process(delta: float) -> void:
	move ()
	animate()

func move () -> void: 
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	move_and_slide ()

func animate () -> void:
	if velocity.x > 0 or velocity.y > 0:
		if Input.is_action_just_pressed("ui_left"):
			texture.flip_h = false
			current_dir = "left"
			animation.play("walkSIDE")

		if Input.is_action_just_pressed("ui_right"):
			texture.flip_h = true
			current_dir = "right"
			animation.play("walkSIDE")

		if Input.is_action_pressed("ui_up"):
			texture.flip_h = false
			current_dir = "up"
			animation.play("walkBACK")

		if Input.is_action_pressed("ui_down"):
			texture.flip_h = false
			current_dir = "down"
			animation.play("walkFRONT")
	else:
		if current_dir == "left":
			animation.play("idleSIDE")
			texture.flip_h = false
			
		if current_dir == "up":
			animation.play("idleBACK")
			texture.flip_h = false
		
		if current_dir == "down":
			animation.play("idleFRONT")
			texture.flip_h = false
		
		if current_dir == "right":
			animation.play("idleSIDE")
			texture.flip_h = true
