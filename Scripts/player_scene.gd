extends CharacterBody2D



const SPEED = 100.0

func _physics_process(delta: float) -> void:
		
	get_input()

	# Get the input direction and handle the movement/deceleration.
	
func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * SPEED
	
	move_and_slide()
