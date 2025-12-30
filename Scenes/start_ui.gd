extends CanvasLayer

var level_scence := load("res://Scenes/level.tscn")
var tween : Tween

func _ready():
	$MarginContainer/Label.visible_ratio = 0.0
	tween = create_tween().set_loops()
	tween.tween_callback($TypingAudio.play)
	tween.tween_property($MarginContainer/Label, "visible_ratio", 1.0, 1.5)
	tween.tween_interval(3.0)
	tween.tween_property($MarginContainer/Label, "visible_ratio", 0.0, 0.1)

func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().change_scene_to_packed(level_scence)
