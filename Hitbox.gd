extends Area2D

@onready var timer = $Timer

func body_entered(body) :
	if body.is_in_group("player"):
		print ("You Died!")
		timer.start()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()


func _on_goombahead_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
