extends PlayerState



func Enter(msg:= {}):
	player.velocity.y = player.jump_velocity

func Physics_update(delta):
	
	
	player.jump_timer += delta
	
	if Input.is_action_pressed("jump") and player.jump_timer < player.jump_time_to_peak:
		player.velocity.y = player.jump_velocity
	else:
		player.velocity.y = player.jump_velocity + 100
		
		state_machine.transition_to("Fall")
		
	player.velocity.y += player.jump_gravity * delta
	
		
	player.velocity.x = move_toward(player.velocity.x, player.direction * player.max_speed, player.accel * delta)
	
		
	
	
	
	
	




	
	
