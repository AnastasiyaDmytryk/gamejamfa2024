extends Node2D

@onready var player = get_node("res://Levels/player.gd")
@onready var label = $Label

const base_text = "[E] to "
var active_areas = [] 
var can_interact = true

func register_area(area: interactionArea):
	can_interact = true
	active_areas.push_back(area)

func unregister_area(area: interactionArea):
	print(area)
	var index = active_areas.find(area)
	if index != -1:
		print("unregistered")
		active_areas.erase(area) 
		print("Active areas after removal:", active_areas)  # Check if the area is really removed
		label.hide()
		can_interact = false

func _process(delta: float) -> void:
	if active_areas.size() > 0 and can_interact:
			label.text = base_text + active_areas[0].action_name  # Show the closest area's action
			label.global_position.y = -36
			label.global_position.x = label.size.x / 2
			label.show()
		
	else:
		label.hide()


func _input(event):
	if event.is_action_pressed("interact") and can_interact:
		if active_areas.size() > 0:
			can_interact = false
			if active_areas[0].interact:
				await active_areas[0].interact.call()
			else:
				print("no enteractables")
			can_interact = true
		label.hide()
