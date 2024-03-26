extends State
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var air_state:State
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func state_process(_delta):
	pass

func  state_input(event:InputEvent):
	if(event.is_action_pressed("Climb")):
		#PhysicsServer2D.area_set_param(get_viewport().find_world_2d().space,PhysicsServer2D.AREA_PARAM_GRAVITY, 0)
		character.velocity.y = character.direction.y * character.SPEED
	
	if(event.is_action_pressed("Jump")):
		next_state = air_state
