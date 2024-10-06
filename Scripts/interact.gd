extends Area2D

signal item_collected

@onready var progress_bar = get_node("/root/TestLevel/CanvasLayer/VBoxContainer/TextureProgressBar2")  

var player_in_range = false
var progress_per_item = 10  

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

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
	if progress_bar.value < 100:
		progress_bar.value += progress_per_item
		if progress_bar.value >= 100:
			_get_to_final_scene()
	queue_free()  
	emit_signal("item_collected")

func _get_to_final_scene():
	get_tree().change_scene_to_file("res://Levels/over.tscn")
