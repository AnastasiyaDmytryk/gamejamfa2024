extends ProgressBar

@onready var player= get_tree().get_first_node_in_group("player")

func _ready():
	player.healthChanged.connect(self.update)
	update()
	
func update():
	value = player.currentHealth * 100 / player.maxHealth
