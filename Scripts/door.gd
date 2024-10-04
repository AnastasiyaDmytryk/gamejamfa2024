extends Area2D
func getRandomRoom():
	var i = randi()%globalRooms.roomSet.size()
	return globalRooms.roomSet[i]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_body_entered(body):

	call_deferred("change_scene_to_random_room")

func change_scene_to_random_room():
	get_tree().change_scene_to_file(getRandomRoom())
