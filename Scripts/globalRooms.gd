extends Node


var roomSet = ["res://Levels/test_level.tscn","res://Terrains/Try_room2.tscn","res://Scenes/Room6.tscn"]
var enemy = ["res://Enemys/catEnemy.tscn","res://Enemys/Chiken.tscn","res://Enemys/dogEnemy.tscn"]
var lodable = ["res://Collectibles/Mug.tscn"]
var currentScene ;
var lodablesOnScreen = 0;
var enemiesOnScreen=0;
var scenCnaged=false;
func _ready() :
	
		randomize()
	
