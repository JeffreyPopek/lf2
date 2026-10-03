extends Node

var current_task = null
	
func _process(delta: float) -> void:
	if current_task == null:
		return
		
	current_task.update(delta)
	
	
	if current_task.is_complete():
		_finish_current_task()
		
func _assign_task(task):
	current_task = task
	print("New Task: ", current_task.task_name)
	
func _cancel_current_task():
	current_task = null
	pass
	
func _finish_current_task():
	print("Completed Task: ", current_task.task_name)
	current_task.complete()
	current_task = null
	

func _is_crew_member_free():
	return current_task == null
