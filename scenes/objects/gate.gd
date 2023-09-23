extends StaticBody2D

class_name Gate

signal player_entered
signal player_exited



func _on_area_2d_body_entered(_body: Node2D) -> void:
	player_entered.emit()


func _on_area_2d_body_exited(_body: Node2D) -> void:
	player_exited.emit()
