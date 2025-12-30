extends CanvasLayer

static var life_img := load("res://Royalty-Free-Game-Art-Spaceships-from-Unlucky-Studio/Royalty Free Game Art - Spaceships from Unlucky Studio/Spaceship_art_pack/life.png")
var time_elapsed := 0
var typing_tween : Tween

func _ready() -> void:
	$MarginContainer3/Label.hide()
	$MarginContainer3/Label.visible_ratio = 0.0
	
func set_health(amount):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = life_img
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP


func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	$MarginContainer/Label.text = str(time_elapsed)
	Global.score = time_elapsed
	
	if time_elapsed >= 25 and time_elapsed <= 28:
		if not $MarginContainer3/Label.visible:
			$MarginContainer3/Label.show()
			start_typing_animation($MarginContainer3/Label)
			$TypingSound.play()
	else:
		$MarginContainer3/Label.hide()
		$MarginContainer3/Label.visible_ratio = 0.0
	
func start_typing_animation(target_label: Label):
	if typing_tween:
		typing_tween.kill()
		
	target_label.visible_ratio = 0.0
	typing_tween = create_tween()
		
	typing_tween.tween_property(target_label, 'visible_ratio', 1.0, 1.5)
