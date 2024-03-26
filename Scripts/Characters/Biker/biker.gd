extends CharacterBody2D

@export var SPEED = 120.0
@onready var player = $"."
@onready var animation  =  $AnimationPlayer
@onready var animation_tree:AnimationTree = $AnimationTree
@onready var state_machine: PlayerStateMachine = $PlayerStateMachine


#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 800
var direction: Vector2 = Vector2.ZERO


func _ready():
	animation_tree.active = true

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	

	direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = direction.x * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	update_animtaion_parameters()	
	update_facing_direction()
	move_and_slide()
	
	
	
	
	
	
func update_facing_direction():
	if direction.x > 0:
		$Marker2D.scale.x  = abs($Marker2D.scale.x) * 1
	elif direction.x < 0:
		$Marker2D.scale.x  = abs($Marker2D.scale.x) * -1
		
func  update_animtaion_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)
	
	

