extends PlayerState

func Enter(msg:={}):
	animation_tree.set("parameters/Ground/transition_request", "Idle")
	
func Handle_input(event):
	if event.is_action_pressed("run_left") or event.is_action_pressed("run_right"):
		
		state_machine.transition_to("Run")
	if event.is_action_pressed("jump"):
		player.jump_timer = 0.0
		state_machine.transition_to("Jump")
		
func Physics_update(delta):
	
	if player.jump_buff:
		player.jump_timer = 0.0
		print("jump buff")
		state_machine.transition_to("Jump")
	if !player.is_on_floor():
		state_machine.transition_to("Fall")
	if player.velocity.length() != 0:
		player.velocity.x = move_toward(player.velocity.x, 0, player.friction * delta)



