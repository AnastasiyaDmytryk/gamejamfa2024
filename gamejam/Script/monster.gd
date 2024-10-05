extends Node2D

@onready var monst = get_tree().get_root().get_node("Monster")
@onready var spit = load("res://Scenes/spit_bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shoot()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
func shoot():
	var instance = spit.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = global_rotation
	monst.add_child.call_deferred(instance)
	

func _on_timer_timeout() -> void:
	shoot()
