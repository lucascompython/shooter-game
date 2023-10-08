extends Node2D

var laser_scene := preload("res://scenes/projectiles/laser.tscn")
var grenade_scene := preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered() -> void:
	print("ENTROU")


func _on_gate_player_exited() -> void:
	print("SAIU")


func _on_player_laser_shot(laser_position: Vector2, direction: Vector2) -> void:
	print("PIU PIU")
	var laser := laser_scene.instantiate() as Area2D
	laser.position = laser_position
	laser.rotation = direction.angle() # this is in rad
	laser.direction = direction
	$Projectiles.add_child(laser)

func _on_player_grenade_shot(grenade_position: Vector2, direction: Vector2) -> void:
	print("BOOM")
	var grenade := grenade_scene.instantiate() as RigidBody2D
	grenade.position = grenade_position
	grenade.linear_velocity = direction * grenade.SPEED 
	
	$Projectiles.add_child(grenade)
	


func _on_house_body_entered(_body: Node2D) -> void: # This signal is from the house scene
	var tween := get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1)



func _on_house_body_exited(_body: Node2D) -> void: # This signal is from the house scene
	var tween := get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1)
