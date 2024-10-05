extends CharacterBody2D
func _ready() -> void:
	print("powerup");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		

func _enter_tree() -> void:
	if GlobalRooms.scenCnaged:
		position.x=randf_range(0,40);
		position.y=randf_range(0,40);


func getRandomLoadable():
	
	var i = randi() % GlobalRooms.lodables.size()
	return GlobalRooms.lodables[i]
	
func _on_body_entered(body: Node2D) -> void:
	body.position.x-=10
	body.position.y-=10
	
	getRandomLoadable().instantiate()
	#disapear
