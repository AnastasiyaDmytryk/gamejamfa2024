extends AnimatedSprite2D

@onready var interaction_area: interactionArea =$"../InteractionArea"

func _ready() -> void:
	# Setting the Callable to interact when this object is interacted with
	interaction_area.interact = Callable(self, "_on_interact")
	position.x = randf_range(-40,40)
	position.y = randf_range(-40,40)


func _on_interact():
	print("Touching coffee mug")
	GlobalRooms.lodablesOnScreen-=1
	
	queue_free()
	InteractionManager.unregister_area(interaction_area)
	# Add code to modify the player's health here



	
