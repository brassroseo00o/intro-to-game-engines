extends Node2D

const SPEED = 60

var direction = 1

@onready var forward: RayCast2D = $AnimatedSprite2D/hitbox/CollisionShape2D2/forward
@onready var backwards: RayCast2D = $AnimatedSprite2D/hitbox/CollisionShape2D2/backwards

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if forward.is_colliding():
		direction = -1
	if backwards.is_colliding():
		direction = 1
		
	position.x +=direction * SPEED * delta
	
