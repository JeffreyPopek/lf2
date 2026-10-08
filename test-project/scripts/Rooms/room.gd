extends Node

@onready var pipe_leak_task_pos = get_node("../PipeLeakTaskPos")
@onready var player_temp = get_node("../Player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(pipe_leak_task_pos.position)
	print("press m to move")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
		_move_player()


func _move_player():
	var tween = create_tween()
	tween.tween_property(player_temp, "position", pipe_leak_task_pos.position, 1.0)
	#player_temp.position = pipe_leak_task_pos.position
	
