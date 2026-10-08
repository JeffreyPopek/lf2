extends Node

var current_depth = 0
var descent_speed = 5

var time_elapsed: float = 0.0

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_elapsed += delta
	
	if time_elapsed >= 1.0:
		time_elapsed = 0.0
		current_depth += descent_speed
