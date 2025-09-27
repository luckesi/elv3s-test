extends CharacterBody2D

@onready var animation: AnimationPlayer = $AnimationPlayer

@export_category("Player Stats")
@export var SPEED: float = 150

var current_dir: String = "none"

func _physics_process(_delta: float) -> void:
	move ()
	animate()

func move () -> void: 
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	move_and_slide ()

func animate () -> void:
	if velocity.x != 0 or velocity.y != 0:
		if Input.is_action_just_pressed("ui_left"):
			current_dir = "left"
			animation.play("walkSIDE")

		if Input.is_action_pressed("ui_up"):
			current_dir = "up"
			animation.play("walkBACK")

		if Input.is_action_pressed("ui_down"):
			current_dir = "down"
			animation.play("walkFRONT")
	else:
		if current_dir == "left":
			animation.play("idleSIDE")
		if current_dir == "up":
			animation.play("idleBACK")
		if current_dir == "down":
			animation.play("idleFRONT")
