extends Control

var is_bouncing_up = false

func _ready():
	$Label/Tween.interpolate_property($Label, "rect_position:y", $Label.rect_position.y, $Label.rect_position.y - 10, 
		1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	$Label/Tween.start()
	$loadingTimer.start();


func _on_Tween_bounce_completed(object, key):
	is_bouncing_up = !is_bouncing_up

	# Adjust the animation parameters based on the bouncing direction
	if is_bouncing_up:
		$Label/Tween.interpolate_property($Label, "rect_position:y", $Label.rect_position.y, $Label.rect_position.y - 10, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	else:
		$Label/Tween.interpolate_property($Label, "rect_position:y", $Label.rect_position.y, $Label.rect_position.y + 10, 1.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)

	# Restart the Tween animation
	$Label/Tween.start()


func _on_loadingTimer_timeout():
	get_tree().change_scene(Global.scene)
