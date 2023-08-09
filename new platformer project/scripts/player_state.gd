extends State
class_name PlayerState

var player: Player
var animation_tree: AnimationTree

func _ready():
	await owner.ready
	
	player = owner as Player
	
	assert(player != null) 
	
