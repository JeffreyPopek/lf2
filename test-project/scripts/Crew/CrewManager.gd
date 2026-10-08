extends Node

var crew_members = []

@onready var hull_system = get_node("../HullSystem")

func _ready() -> void:
	crew_members = get_children()


func _process(delta: float) -> void:
	pass
	
	
func _request_crew_member():
	for crew_member in crew_members:
		if crew_member._is_crew_member_free():
			return crew_member
	return null;
	
	
	
func _request_hull_repair():  # move to a general task/game manager later
	var crew_member = _request_crew_member()
	
	if crew_member == null:
		print("No crew member available")
		return
		
	var repair_task = Task.new()
	
	repair_task.task_name = "Hull Repair Task"
	repair_task.task_type = Task.TaskType.REPAIR
	repair_task.duration = 5.0
	repair_task.target = hull_system
	
	crew_member._assign_task(repair_task)
	
func _request_leak_repair():
	var crew_member = _request_crew_member()
	
	if crew_member == null:
		print("No crew member available")
		return
		
	var leak_task = Task.new()
	
	leak_task.task_name = "Leak Repair Task"
	leak_task.task_type = Task.TaskType.LEAK
	leak_task.duration = 5.0
	leak_task.target = hull_system
	
	crew_member._assign_task(leak_task)
	
	
func _request_research():
	var crew_member = _request_crew_member()
	
	if crew_member == null:
		print("No crew member available")
		return

	print("researching")
	crew_member._set_crew_research()
	
	
	
