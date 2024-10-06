extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		

func _enter_tree() -> void:
	if GlobalRooms.scenCnaged:
		position.x=randf_range(0,40);
		position.y=randf_range(0,40);


func getRandomLoadable():
	
	var i = randi() % GlobalRooms.lodable.size()
	var path = GlobalRooms.lodable[i]
	var resource = load(path)
	return resource
	
func getRandomEnemy():
	
	var i = randi() % GlobalRooms.enemy.size()
	var path = GlobalRooms.enemy[i]
	var resource = load(path)
	return resource
	
func _on_body_entered(body: CharacterBody2D) -> void:
	var n = randf_range(0,1)
	var n2 = randf_range(0,1)
	
	if GlobalRooms.enemiesOnScreen < n : 
		var enemy = getRandomEnemy()
		var instance1 = enemy.instantiate()
		get_tree().root.add_child(instance1)
		GlobalRooms.enemiesOnScreen+=1
		
	if GlobalRooms.lodablesOnScreen < n2:
		var loadable = getRandomLoadable()
		var instance2 = loadable.instantiate()
		get_tree().root.add_child(instance2)
		GlobalRooms.lodablesOnScreen+=1
		
	hide()

	
	#disapear
