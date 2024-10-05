extends CharacterBody2D


func _ready() -> void:
	position.x=randf_range(0,40);
	position.y=randf_range(0,40);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		








func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
