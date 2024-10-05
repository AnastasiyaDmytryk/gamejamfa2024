extends Area2D

signal item_collected

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

var player_in_range = false

func _on_body_entered(body):
	if body.name == "Player":  
		player_in_range = true

func _on_body_exited(body):
	if body.name == "Player":
		player_in_range = false

func _process(delta):
	if player_in_range and Input.is_action_just_pressed("select"):
		_collect_item()

func _collect_item():
	emit_signal("item_collected")
	queue_free()  
