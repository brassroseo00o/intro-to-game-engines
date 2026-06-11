extends Area2D
class_name Goombahead
@onready var goombahead: Goombahead = $"."

func _on_body_entered(body: Node2D) -> void:
	body.jump(3)
	get_parent().die()
