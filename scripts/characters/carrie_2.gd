extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var SPEED: float = 150
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
			anim.flip_h = false
			anim.play("walkside")
			current_dir = "left"

		if Input.is_action_just_pressed("ui_right"):
			anim.flip_h = true
			anim.play("walkside")
			current_dir = "right"

		if Input.is_action_just_pressed("ui_up"):
			anim.flip_h = false
			anim.play("walkup")
			current_dir = "up"

		if Input.is_action_just_pressed("ui_down"):
			anim.flip_h = false
			anim.play("walkdown")
			current_dir = "down"
		
	else:
		if current_dir == "left":
			anim.play("idleside")
			anim.flip_h = false

		if current_dir == "right":
			anim.play("idleside")
			anim.flip_h = true

		if current_dir == "up":
			anim.play("idleup")
			anim.flip_h = false

		if current_dir == "down":
			anim.play("idledown")
			anim.flip_h = false

	
