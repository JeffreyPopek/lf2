class_name Task
extends RefCounted


enum TaskType {
	REPAIR,
	RESEARCH,
	LEAK
}

var task_name : String
var duration: float
var progress: float = 0.0
var target
var task_type


func update(delta):
	progress += delta
	
func is_complete():
	if progress >= duration:
		return true


func complete():
	if task_type == TaskType.REPAIR:
		target._repair_hull()
	elif task_type == TaskType.LEAK:
		target._fix_leak()
		
	print(task_name, " task completed")
