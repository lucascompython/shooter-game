extends RigidBody2D

const SPEED := 750

func explode() -> void:
	$AnimationPlayer.play("Explosion")

