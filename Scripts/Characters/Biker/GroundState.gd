extends State

class_name  GroundState
@export var jump_velocity:float = -250.0

@export var air_state: State
@export var climb_state:State
@export var attack_state: State

@export var jump_animation: String = "jump_start"
@export var climb_animation: String = "climb"
@export var attack_node: String = "attack1"


func state_process(_delta):
	if(!character.is_on_floor()):
		next_state = air_state
		

func state_input(event: InputEvent):
	if (event.is_action_pressed("Jump")):
		jump()
	if (event.is_action_pressed("Attack")):
		attack()
	if (event.is_action_pressed("Climb")):
		climb()



func  jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)
	
func  attack():
	next_state = attack_state
	playback.travel(attack_node)

func climb():
	next_state = climb_state
	playback.travel(climb_animation)
