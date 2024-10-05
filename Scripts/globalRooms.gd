extends Node


<<<<<<< Updated upstream
var roomSet = ["res://Levels/test_level.tscn","res://Terrains/Room0.tscn","res://Terrains/Room1.tscn"]
var currentScene ;
=======
var roomSet = ["res://Levels/test_level.tscn","res://Terrains/Try_room2.tscn","res://Scenes/Room6.tscn"]
var lodables = ["res://Enemys/catEnemy.tscn","res://Enemys/Chiken.tscn","res://Enemys/dogEnemy.tscn"]
var currentScene ;
var enemiesOnScreen=0;
>>>>>>> Stashed changes
var scenCnaged=false;
func _ready() :
	
		randomize()
	
