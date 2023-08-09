extends PlayerState

func Enter(msg:={}):
	animation_tree.set("parameters/Ground/transition_request", "Run")
	
func Handle_input(event):
	
	if event.is_action_pressed("jump"):
		player.jump_timer = 0.0
		state_machine.transition_to("Jump")
		
func Physics_update(delta):
	if player.jump_buff:
		player.jump_timer = 0.0
		print("jump buff")		
		state_machine.transition_to("Jump")
		
	if !Input.is_action_pressed("run_left") and !Input.is_action_pressed("run_right"):
		state_machine.transition_to("Idle")
	
	if !player.is_on_floor():
		state_machine.transition_to("Fall")
	
	player.velocity.x = move_toward(player.velocity.x, player.direction * player.max_speed, player.accel * delta)
	
