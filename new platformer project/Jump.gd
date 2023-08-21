extends PlayerState



func Enter(msg:= {}):
	player.velocity.y = player.jump_velocity
	animation_tree.set("parameters/Air/transition_request", "Jump")
	
func Physics_update(delta):
	if bottom_raycast.is_colliding() and !top_raycast.is_colliding():
		if player.direction < 0:
			if Input.is_action_pressed("run_left"):
				state_machine.transition_to("Wall_hang")
		elif player.direction > 0:
			if Input.is_action_pressed("run_right"):
				state_machine.transition_to("Wall_hang")
	
	player.jump_timer += delta
	
	if Input.is_action_pressed("jump") and player.jump_timer < player.jump_time_to_peak:
		player.velocity.y = player.jump_velocity
	else:
		player.velocity.y = player.jump_velocity + 100
		
		state_machine.transition_to("Fall")
		
	player.velocity.y += player.jump_gravity * delta
	
		
	player.velocity.x = move_toward(player.velocity.x, player.direction * player.max_speed, player.accel * delta)
	
		
	
	
	
	
	




	
	
