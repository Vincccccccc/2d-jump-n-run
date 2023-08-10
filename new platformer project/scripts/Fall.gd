extends PlayerState

func Enter(msg:={}):
	animation_tree.set("parameters/Air/transition_request", "Fall")

func Handle_input(event):
	if event.is_action_pressed("jump"):
		player.jump_buff = true
		player.jump_buff_timer.start()
		
	
func Physics_update(delta):
	if player.is_on_floor():
		if player.velocity.x == 0:
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")
			
	player.velocity.y += player.fall_gravity * delta
	
	player.velocity.x = move_toward(player.velocity.x, player.direction * player.max_speed, player.accel * delta)
	
	
