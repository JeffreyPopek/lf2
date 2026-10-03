extends Node

@onready var crew_manager = get_node("CrewManager")
@onready var research_system = get_node("ResearchSystem")
@onready var hull_system = get_node("HullSystem")

func _ready() -> void:
	# debug only, expand later
	crew_manager._request_hull_repair()
	#crew_manager._request_research()
	#research_system._start_researching()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
		_show_menu()
		
	if Input.is_action_just_pressed("Breach"):
		hull_system._breach_event()
		
	if Input.is_action_just_pressed("Repair"):
		crew_manager._request_hull_repair()


func _show_menu():
	print("menus here")
