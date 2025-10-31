extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

## Grace period the player has to be able to still jump after being off the ground (in seconds)
const COYOTE_JUMP_TIME:float = 0.08

var _coyote_jump:float = COYOTE_JUMP_TIME

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		# Count down jump time by delta
		if _coyote_jump > 0.0:
			_coyote_jump -= delta
		velocity += get_gravity() * delta
	elif _coyote_jump < COYOTE_JUMP_TIME:
		_coyote_jump = COYOTE_JUMP_TIME
	# Handle jump.
	if Input.is_action_just_pressed("jump") and _coyote_jump > 0.0:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if (velocity.x > 0.0):
		sprite.flip_h = false
	else:
		sprite.flip_h = true

	if (velocity.x == 0.0):
		sprite.play("idle")
	else:
		sprite.play("run")

	move_and_slide()
