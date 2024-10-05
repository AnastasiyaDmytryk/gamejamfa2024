extends Area2D


# Called when the node enters the scene tree for the first time.
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
	var path = GlobalRooms.lodables[i]
	var resource = load(path)
	return resource

		
	
	
	

	
func _on_body_entered(body: CharacterBody2D) -> void:
	var n = randf_range(0,2)
	if GlobalRooms.enemiesOnScreen < n : 
		var loadable = getRandomLoadable()
		var instance = loadable.instantiate()
		get_tree().root.add_child(instance)
		GlobalRooms.enemiesOnScreen+=1
	hide()

	
	#disapear
