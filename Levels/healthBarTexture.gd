extends TextureProgressBar

@onready var player= get_node("res://Levels/player.gd")

func _ready():
	player.healthChanged.connect(self.update)
	update()
	
func update():
	value = player.currentHealth * 100 / player.maxHealth
