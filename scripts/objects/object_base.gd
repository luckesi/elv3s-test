extends Area2D

@onready var right_ray: RayCast2D = $RightRay
@onready var left_ray: RayCast2D = $LeftRay
@onready var up_ray: RayCast2D = $UpRay
@onready var down_ray: RayCast2D = $DownRay

func _physics_process(_delta: float) -> void:
	pass
