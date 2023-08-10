extends PlayerState

func Enter(msg:={}):
	animation_tree.set("parameters/Ground/transition_request", "Crouch")
	
func Handle_input(event):
	if event.is_action_pressed("crouch") or event.is_action_pressed("jump"):
		if player.direction != 0:
			state_machine.transition_to("Run")
		else:
			state_machine.transition_to("Idle")
			

func Physics_update(delta):
	player.velocity.x = move_toward(player.velocity.x, player.direction * player.crouch_max_speed, player.crouch_accel * delta)
	if player.direction != 0:
		animation_tree.set("parameters/Ground/transition_request", "Crouch_walk")
	else:
		animation_tree.set("parameters/Ground/transition_request", "Crouch")
		player.velocity.x = move_toward(player.velocity.x, 0, player.crouch_friction * delta)
	
	
