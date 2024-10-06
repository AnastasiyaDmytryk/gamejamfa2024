extends Area2D


var current_scene

func getRandomRoom():
	
	var i = randi() % GlobalRooms.roomSet.size()
	return GlobalRooms.roomSet[i]

#Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalRooms.scenCnaged = false 
	current_scene = get_tree().current_scene 
	

#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body):
	# Only change the scene if it's not already changing
	if not GlobalRooms.scenCnaged:
		GlobalRooms.scenCnaged=true;
		call_deferred("change_scene_to_random_room")
		
func change_scene_to_random_room():
	print(get_tree)
	get_tree().change_scene_to_file(getRandomRoom())
	GlobalRooms.scenCnaged = false 
	GlobalRooms.enemiesOnScreen=0
	
	
	
