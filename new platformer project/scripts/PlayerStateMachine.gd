extends Node


@onready var current_state: State = get_node(initial_state)
@export var initial_state: NodePath
@export var animation_tree: AnimationTree
@export var animated_sprite: AnimatedSprite2D
@export var top_raycast: RayCast2D
@export var bottom_raycast: RayCast2D

var current_state_name = "Idle"

func _ready():
	await owner.ready
	for child in get_children():
		child.state_machine = self
		child.animation_tree = animation_tree
		child.animated_sprite = animated_sprite
		child.top_raycast = top_raycast
		child.bottom_raycast = bottom_raycast
		
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
	
