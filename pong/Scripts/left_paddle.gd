extends CharacterBody2D

const VSPEED = 450.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("up_p1", "down_p1")
	velocity.y = direction * VSPEED * delta
	move_and_collide(velocity)
	position.y = clamp(position.y, 60, get_viewport_rect().size.y - 60)
