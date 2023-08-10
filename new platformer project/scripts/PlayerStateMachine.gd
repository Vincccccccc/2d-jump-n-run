extends Node

@export var initial_state: NodePath
@onready var current_state: State = get_node(initial_state)
@export var animation_tree: AnimationTree
var current_state_name = "Idle"

func _ready():
	await owner.ready
	for child in get_children():
		child.state_machine = self
		child.animation_tree = animation_tree
		
func _unhandled_input(event):
	current_state.Handle_input(event)

func _physics_process(delta):
	
	current_state.Physics_update(delta)
	
func transition_to(new_state_name, msg:={}):
	if not has_node(new_state_name):
		return
	
	current_state.Exit()
	current_state = get_node(new_state_name)
	current_state_name = new_state_name
	if current_state_name == "Idle" or current_state_name == "Run" or current_state_name == "Crouch":
		animation_tree.set("parameters/in_air_state/transition_request", "Ground")
	else:
		animation_tree.set("parameters/in_air_state/transition_request", "Air")
	current_state.Enter(msg)
	
