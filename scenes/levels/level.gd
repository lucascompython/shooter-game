extends Node2D

var laser_scene := preload("res://scenes/projectiles/laser.tscn")
var grenade_scene := preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered() -> void:
	print("ENTROU")


func _on_gate_player_exited() -> void:
	print("SAIU")


func _on_player_laser_shot(position: Vector2, direction: Vector2) -> void:
	print("PIU PIU")
	var laser := laser_scene.instantiate() as Area2D
	laser.position = position
	laser.rotation = direction.angle() # this is in rad
	laser.direction = direction
	$Projectiles.add_child(laser)

func _on_player_grenade_shot(position: Vector2, direction: Vector2) -> void:
	print("BOOM")
	var grenade := grenade_scene.instantiate() as RigidBody2D
	grenade.position = position
	grenade.linear_velocity = direction * grenade.SPEED 
	
	$Projectiles.add_child(grenade)
	
	
