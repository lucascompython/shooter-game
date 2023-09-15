extends Area2D

const SPEED := 2000
var direction: Vector2

func _process(delta: float) -> void:
	position += direction * SPEED * delta
