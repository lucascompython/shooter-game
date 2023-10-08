extends Area2D

const SPEED := 2000
var direction: Vector2

func _process(delta: float) -> void:
	position += direction * SPEED * delta


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("hit"):
		print("DAMAGE DRONE")

	queue_free()


func _on_self_destruct_timer_timeout():
	queue_free()
