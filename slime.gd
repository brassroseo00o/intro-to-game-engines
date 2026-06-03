extends Node2D

const SPEED = 60

var direction = 1

@onready var forward: RayCast2D = $AnimatedSprite2D/hitbox/CollisionShape2D2/forward
@onready var backwards: RayCast2D = $AnimatedSprite2D/hitbox/CollisionShape2D2/backwards
const GOOMAPARTICLES = preload("uid://d0ldpbwrygduv")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if forward.is_colliding():
		direction = -1
	if backwards.is_colliding():
		direction = 1
		
	position.x +=direction * SPEED * delta

func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
func die():
	var particles = GOOMAPARTICLES.instantiate()
	get_parent().add_child(particles)
	particles.global_position = global_position
	queue_free()
