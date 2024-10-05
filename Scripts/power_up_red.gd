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

	
func _on_body_entered(body: Node2D) -> void:
	print("Power up touched");
	#disapear
	#spawn enemy or power up randomly 
	
	pass # Replace with function body.
