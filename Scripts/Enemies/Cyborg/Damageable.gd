extends Node
class_name  Damageable

@export var health:float = 20.0:
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value - health) #Remainder after attack- previous(negative number)
		health = value
		print(health)



func hit(damage:int):
	health -= damage
	if(health <= 0):
		get_parent().queue_free()
