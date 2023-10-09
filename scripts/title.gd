extends Node2D

var target_pos = Vector2(122, 180)
var anim_duration = 5.0
var current_time = 0.0

var heart = preload("res://assets/heart.png")
var spawned_heart = []

func _ready():
	
	var platform = OS.get_name()
	
	if platform == "Android" || platform == "IOS":
		$CanvasLayer/ExitButton.visible = true
	else:
		$CanvasLayer/ExitButton.visible = false
	
	$heartSpawnTimer.start()
	randomize()
	
func _process(delta):
	
	if current_time < anim_duration:
		var interpolation = current_time / anim_duration
		var new_pos =  $CanvasLayer/Title.rect_position.linear_interpolate(target_pos, interpolation)
		
		$CanvasLayer/Title.rect_position = new_pos
		
		current_time += delta
		
		
	else:
		$CanvasLayer/Title.rect_position = target_pos	
			



func _on_heartSpawnTimer_timeout():
	var screen_size = get_viewport().size
	for i in range(2):
		var random_x = rand_range(0.0, screen_size.x)
		var random_y = rand_range(0.0, screen_size.y)

		var new_heart = Sprite.new()
		new_heart.texture = heart
		new_heart.position = Vector2(random_x, random_y)

		add_child(new_heart)
		spawned_heart.append(new_heart)
	
	$heartClearTimer.start()
	$heartDestroyTimer.start()
	

func _on_heartDestroyTimer_timeout():
	if spawned_heart.size() > 0:
		var sprite = spawned_heart[0]
		if sprite:
			spawned_heart.remove(0)
			sprite.queue_free()
		
	$heartSpawnTimer.start()


func _on_heartClearTimer_timeout():
	if spawned_heart.size() > 0:
		for sprite in spawned_heart:
			sprite.queue_free()
			print(sprite)
		spawned_heart.clear()
		print("Array cleared")



func _on_StartButton_pressed():
	Global.scene = "res://scenes/main.tscn"
	get_tree().change_scene(Global.loading_scene)
	print("Change scene")


func _on_ExitButton_pressed():
	get_tree().quit()
