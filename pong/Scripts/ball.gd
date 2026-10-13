extends CharacterBody2D

const INITIAL_SPEED = 350.0
var speed: float = 350.0
var speed_limit: float = 500.0
var speed_mod: float = 20.0

var bouncable: bool = true

var start_pos

func _ready():
	var x = [-1, 1].pick_random() # Left or right
	var y = randf_range(-0.8, 0.8) # Steepness (angle)
	var direction = Vector2(x, y).normalized()
	velocity = direction * speed
	start_pos = global_position
	
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		var hit_object = collision.get_collider()
		if hit_object.is_in_group("paddle") and bouncable:
			start_bounce_cooldown() # Avoid double bouncing
			var paddle_shape = hit_object.get_node("Collision")
			var half_height = paddle_shape.shape.extents.y # Half the height
			
			var collision_point = collision.get_position()
			var paddle_y = hit_object.global_position.y
			var local_y = collision_point.y - paddle_y
			
			var offset_percent = clamp(local_y / half_height, -0.999, 0.999) # Convert to percent
			print(offset_percent)
			
			var bounce_angle = offset_percent * PI/4 #45 Degrees
			
			var base_direction
			if hit_object.name == "LeftPaddle":
				base_direction = 1
			else:
				base_direction = -1
				
			var new_direction = Vector2(base_direction, 0).rotated(bounce_angle)
			
			var incoming_vertical = sign(velocity.y)
			
			if incoming_vertical != 0:
				if sign(new_direction.y) != incoming_vertical:
					new_direction.y = -new_direction.y
			velocity = new_direction.normalized() * speed
			speed = (speed + speed_mod) if (speed < speed_limit) else speed_limit
			print(speed)
		elif hit_object.is_in_group("paddle") and !bouncable:
			#velocity = velocity.bounce(Vector2(1,0))
			print("unstucked")
		else:
			velocity = velocity.bounce(collision.get_normal())

func reset():
	global_position = start_pos
	var x = [-1, 1].pick_random() # Left or right
	var y = randf_range(-0.8, 0.8) # Steepness (angle)
	var direction = Vector2(x, y).normalized()
	speed = INITIAL_SPEED
	velocity = direction * speed

func start_bounce_cooldown():
	bouncable = false
	get_tree().create_timer(0.1).timeout.connect(toggle_bouncable)
	
func toggle_bouncable():
	bouncable = true
