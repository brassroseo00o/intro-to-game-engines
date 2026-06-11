extends Node2D

const SPEED = 50


var direction = 1

@onready var forward: RayCast2D = $AnimatedSprite2D/hitbox/CollisionShape2D2/forward
@onready var backwards: RayCast2D = $AnimatedSprite2D/hitbox/CollisionShape2D2/backwards
const GOOMAPARTICLES = preload("uid://d0ldpbwrygduv")
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $Goombahead/AudioStreamPlayer2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if forward.is_colliding():
		direction = -1
	if backwards.is_colliding():
		direction = 1
		
	position.x +=direction * SPEED * delta

func _on_body_entered(_body: Node2D) -> void:
	pass
func die():
	audio_stream_player_2d.play()
	var particles = GOOMAPARTICLES.instantiate()
	particles.global_position = global_position
	get_parent().add_child(particles)
	visible = false
	$AnimatedSprite2D/hitbox/CollisionShape2D2.disabled = true
	$Goombahead/CollisionShape2D.disabled = true
	await audio_stream_player_2d.finished
	queue_free()
