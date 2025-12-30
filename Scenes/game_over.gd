extends Control

var level_scence := load("res://Scenes/level.tscn")
var tween : Tween

func _ready():
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score)

	$CenterContainer/VBoxContainer/Label.visible_ratio = 0.0
	tween = create_tween()
	tween.tween_property($CenterContainer/VBoxContainer/Label, "visible_ratio", 1.0, 1.5)
	$TypingSound.play()
	
#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("shoot"):
		#get_tree().change_scene_to_packed(level_scence)
		
func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().change_scene_to_packed(level_scence)
