extends Area2D

var speed : int
var rotation_speed 
var direction_x : float

signal collison
var can_collide := true

func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randf_range(0, width)
	var random_y = rng.randf_range(-150, -50)
	position = Vector2(random_x, random_y)
	
	var path := "res://Royalty-Free-Game-Art-Spaceships-from-Unlucky-Studio/Royalty Free Game Art - Spaceships from Unlucky Studio/Spaceship_art_pack/Aestroids/aestroid_" + str(rng.randi_range(1, 4)) + ".png" 
	$AestroidImg.texture = load(path)
	
	speed =  rng.randi_range(200, 500)
	direction_x = rng.randi_range(-1, 1)
	rotation_speed = rng.randf_range(40, 100)

func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(_body: Node2D) -> void:
	if can_collide:
		collison.emit()

func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	$ExplosionSound.play()
	$AestroidImg.hide()
	can_collide = false
	await get_tree().create_timer(0.5).timeout
	queue_free()
