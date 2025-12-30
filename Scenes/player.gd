extends CharacterBody2D

var speed := 500
signal bullet(pos)
var can_shoot : bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var center_x = (get_viewport().get_visible_rect().size[0]) / 2
	position = Vector2(center_x, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed 
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot") and can_shoot:
		bullet.emit($MarkedBulletPos.global_position)
		can_shoot = false
		$BulletTimer.start()
		$LaserSound.play()

func _on_play_collison_sound():
	$DamageSound.play()

func _on_bullet_timer_timeout() -> void:
	can_shoot = true
