extends Area2D
class_name Goombahead
 
func _on_body_entered(body: Node2D) -> void:
		body.jump(2)
		get_parent().die()
