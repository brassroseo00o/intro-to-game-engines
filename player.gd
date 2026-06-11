extends CharacterBody2D
var on_ladder = false

const SPEED = 150.0
const CLIMB_SPEED = 150.0
const GRAVITY = 600.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var double_jump: bool = false
var is_on_ladder = false
var climb_speed = 100


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if is_on_floor() and double_jump == true:
		double_jump = false
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			jump()
		elif double_jump == false:
			double_jump = true
			jump()
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else :
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if on_ladder:
		velocity.y = 0
	if Input.is_action_pressed("ui_up"):
			velocity.y = -CLIMB_SPEED
	if Input.is_action_pressed("ui_down"):
			velocity.y = CLIMB_SPEED
	else:
		velocity.y += GRAVITY * delta
	move_and_slide()

func jump(multi : float = 1):
		velocity.y = JUMP_VELOCITY * multi
