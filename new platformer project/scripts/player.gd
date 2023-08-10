extends CharacterBody2D
class_name Player

@onready var label = $Label
@onready var state_machine = $PlayerStateMachine
@onready var animation_tree = $AnimationTree

var jump_time_to_peak = 0.22
var jump_time_to_descent = 0.18
var jump_height = 60
var jump_timer: float = 0.0
var is_jumping: bool = false
var jump_buff = false

var direction: float
var max_speed = 500
var accel = 3000
var friction = 3000

var crouch_max_speed = 200
var crouch_accel = 2000
var crouch_friction = 3000


@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0
@onready var jump_buff_timer = $jump_buff
@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	animation_tree.set_active(true)
	print(animation_tree)
	
func _physics_process(_delta):
	
	if Input.is_action_just_pressed("run_left"):
		animated_sprite.flip_h = true
	elif Input.is_action_just_pressed("run_right"):
		animated_sprite.flip_h = false
	label.text = state_machine.current_state_name
	direction = Input.get_axis("run_left", "run_right")
	move_and_slide()


func _on_jump_buff_timeout():
	jump_buff = false
