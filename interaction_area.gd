extends Area2D

class_name interactionArea
@export var action_name: String = "interact"  

var interact: Callable = func():
	pass  

func _on_body_entered(body: Node2D) -> void:
	
	print("Entered interaction area")
	InteractionManager.register_area(self)  

func _on_body_exited(body: Node2D) -> void:
	print("Exited interaction area")
	InteractionManager.unregister_area(self)  
