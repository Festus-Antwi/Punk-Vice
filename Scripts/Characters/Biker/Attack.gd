extends State



@export var return_state:State
@export var return_animation_node:String = "move"
@export var attack1_name:String = "attack1"
@export var attack2_name:String = "attack2"
@onready var timer:Timer = $Timer
@export var attack2_node: String = "attack2"


func  state_input(event :InputEvent):
	if(event.is_action_pressed("Attack")):
		timer.start() #resets timer everytime key is pressed


func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == attack1_name):
		if (timer.is_stopped()): # If wait time is done
			next_state = return_state
			playback.travel(return_animation_node)
		else: #if the timer has not stopped to go attack2 animation
			playback.travel(attack2_node)
			
	if (anim_name == attack2_name):
		next_state = return_state
		playback.travel(return_animation_node)
		
