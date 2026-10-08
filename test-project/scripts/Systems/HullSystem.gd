extends Node

# hull
var max_hull_integrity = 100
var current_hull_integrity

# flood
var max_flood_level = 100
var current_flood_level

# leaks, to be expanded upon with catastrophe system
var active_leaks = 0
var max_leaks = 2

var leak_timer: float = 0.0
var next_leak_time: float = 5.0

var damage_timer: float = 0.0

# repair
var repair_time: float = 5.0
var repair_crew_required = 1



#		.    = current node
#		..   = parent
#		/    at the beginning = absolute path from root

@onready var crew_manager = get_node("../CrewManager")
@onready var research_system = get_node("../ResearchSystem")


func _ready() -> void:
	current_hull_integrity = max_hull_integrity
	current_flood_level = 0			
	
	_set_next_leak_time()
	
func _process(delta: float) -> void:
	leak_timer += delta
	
	if leak_timer >= next_leak_time:
		leak_timer = 0.0
		_try_create_leak()
		_set_next_leak_time()
	
	if active_leaks > 0:
		damage_timer += delta
		
		if damage_timer >= 1.0:
			damage_timer = 0.0
			
			take_damage(active_leaks)
			flood_event()

func take_damage(amount):	
	current_hull_integrity -= amount
	
	if current_hull_integrity < 0:
		current_hull_integrity = 0
	
	#print("Hull Integrity: ", current_hull_integrity)
	
	
func _set_next_leak_time():
	next_leak_time = randf_range(5.0, 10.0) # subject to change
	
func _try_create_leak():
	if active_leaks >= max_leaks:
		return
	
	active_leaks += 1
	
	print("Leak started!")
	print("Active leaks: ", active_leaks)
	
func flood_event():
	current_flood_level += active_leaks * 2 # change magic number depending on how fast/slow leaks feel
	
	if current_flood_level > max_flood_level:
		current_flood_level = max_flood_level
	
	#print("Water Levels: ", current_flood_level, "/", max_flood_level)
	
	if current_flood_level >= max_flood_level:
		print("Room fully flooded!")
	
func _repair_hull():	
	current_hull_integrity = max_hull_integrity
	current_flood_level = 0			# just reset it for now
	
	
func _fix_leak():
	active_leaks -= 1
