extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	var x = [-1, 1].pick_random() # Left or right
	var y = randf_range(-0.8, 0.8) # Steepness (angle)
	var direction = Vector2(x, y).normalized()
	velocity = direction * SPEED
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		var norm = collision.get_normal()
		velocity = velocity.bounce(norm)
