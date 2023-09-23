extends CharacterBody2D


const SPEED := 1000

signal laser_shot(position: Vector2, direction: Vector2)
signal grenade_shot(position: Vector2, direction: Vector2)

var can_laser := true
var can_grenade := true

func _physics_process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	
	
	# input
	var direction := Input.get_vector("left", "right", "up", "down")
	#position += direction * SPEED * delta
	
	velocity = direction * SPEED 
	move_and_slide()
	
func _process(_delta: float) -> void:
	# laser shooting input
	if Input.is_action_pressed("primary action") and can_laser:
		$LaserShootingParticles.emitting = true
		
		
		var pos_markers := $ProjectilesStartPositions.get_children()
		var selected_pos: Marker2D = pos_markers.pick_random()
		
		var player_direction := (get_global_mouse_position() - position).normalized()
		
		
		
		laser_shot.emit(selected_pos.global_position, player_direction)
		can_laser = false
		$LaserTimer.start()
		
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		var pos_markers := $ProjectilesStartPositions.get_children()
		var selected_pos: Marker2D = pos_markers.pick_random()
		
		var player_direction := (get_global_mouse_position() - position).normalized()
	
	
		grenade_shot.emit(selected_pos.global_position, player_direction)
		
		can_grenade = false
		$GrenadeTimer.start()


func _on_laser_timer_timeout() -> void:
	can_laser = true

func _on_grenade_timer_timeout() -> void:
	can_grenade = true
