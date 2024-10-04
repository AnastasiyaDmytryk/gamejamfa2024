extends Area2D

var scene_changing = false  # Add a flag to prevent repeated scene changes

func getRandomRoom():
	var i = randi() % GlobalRooms.roomSet.size()
	return GlobalRooms.roomSet[i]

#Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body):
	# Only change the scene if it's not already changing
	if not scene_changing:
		scene_changing = true
		call_deferred("change_scene_to_random_room")
func change_scene_to_random_room():
	GlobalRooms.currentScene= getRandomRoom()
	get_tree().change_scene_to_file(GlobalRooms.currentScene)
