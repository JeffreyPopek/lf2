extends Node

@onready var depth_system = get_node("../DepthSystem")
@onready var depth_label = get_node("PanelContainer/VBoxContainer/DepthLabel")

@onready var hull_system = get_node("../HullSystem")
@onready var hull_bar = get_node("PanelContainer/VBoxContainer/HullBar")
@onready var flood_bar = get_node("PanelContainer/VBoxContainer/FloodBar")

@onready var research_system = get_node("../ResearchSystem")
@onready var research_label = get_node("PanelContainer/VBoxContainer/ResearchLabel")
@onready var research_bar = get_node("PanelContainer/VBoxContainer/ResearchBar")

@onready var crew_manager = get_node("../CrewManager")
@onready var crew_1_label = get_node("PanelContainer/VBoxContainer/Crew1Label")
@onready var crew_2_label = get_node("PanelContainer/VBoxContainer/Crew2Label")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		depth_label.text = "Depth: " + str(depth_system.current_depth) + "m"
		
		hull_bar.value = hull_system.current_hull_integrity
		flood_bar.value = hull_system.current_flood_level
		
		research_label.text = "Research level: " + str(research_system.research_level)
		research_bar.value = research_system.current_research_xp
		
		#crew_1_label.text = "Crew 1: " + crew_manager.crew_members[0].current_task.task_type
		#crew_2_label.text = "Crew 2: " + crew_manager.crew_members[1].current_task.task_type
		
		
