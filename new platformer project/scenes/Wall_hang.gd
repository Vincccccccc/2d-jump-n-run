extends PlayerState

func Enter(msg:={}):
	animation_tree.set("parameters/Air/transition_request", "Wall_hang")
	player.velocity = Vector2.ZERO

func Physics_update(delta):
	player.velocity = Vector2.ZERO
	
func Handle_input(event):
	if event.is_action_pressed("jump"):
		top_raycast.enabled = false
		bottom_raycast.enabled = false
		player.jump_timer = 0.0
		state_machine.transition_to("Jump")
