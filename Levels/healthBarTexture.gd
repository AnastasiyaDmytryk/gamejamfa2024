extends TextureProgressBar

@export var player: Player

func _ready():
	player.healthChanged.connect(self.update)
	update()
	
func update():
	value = player.currentHealth * 100 / player.maxHealth
