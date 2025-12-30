extends Node2D

var astroid_scene : PackedScene = load("res://Scenes/astroide.tscn")
var bullet_scene : PackedScene = load("res://Scenes/bullet.tscn")

var health : int = 5

func _ready() -> void:
	get_tree().call_group('ui', 'set_health', health)

func _on_astroid_timer_timeout() -> void:
	var astroid = astroid_scene.instantiate()
	$Astroides.add_child(astroid)
	
	astroid.connect('collison', _on_astroid_collison)

func _on_astroid_collison():
	health -= 1
	get_tree().call_group('ui', 'set_health', health)
	if health <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
	$Player._on_play_collison_sound()	 

func _on_player_bullet(pos) -> void:
	var bullet = bullet_scene.instantiate()
	$Bullets.add_child(bullet)
	bullet.position = pos
