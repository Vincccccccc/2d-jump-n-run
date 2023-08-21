extends State
class_name PlayerState

var player: Player
var animation_tree: AnimationTree
var animated_sprite: AnimatedSprite2D
var top_raycast: RayCast2D
var bottom_raycast: RayCast2D
func _ready():
	await owner.ready
	
	player = owner as Player
	
	assert(player != null) 
	
