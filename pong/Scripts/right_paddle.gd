extends CharacterBody2D

const VSPEED = 400.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("up_p2", "down_p2")
	velocity.y = direction * VSPEED * delta 
	move_and_collide(velocity)
	position.y = clamp(position.y, 68, get_viewport_rect().size.y - 68)
