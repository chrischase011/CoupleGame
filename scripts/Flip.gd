extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var cardback

var questions = ["Who made the first move?", "When did you first know you were in love with your partner?",
		"Who is more jealous, you or your partner?", "Who controls the finances in your relationship?", "Who initiates sex more often, you or your partner?", 
		"Who is more likely to get emotional during an argument?", "Who is more of a social butterfly, you or your partner?", 
		"Who takes the longest to get ready in the morning?", "Who is more likely to say “I love you”?", "Who is the better cook?"]

# Called when the node enters the scene tree for the first time.
func _ready():
	var parent = get_parent()
	cardback = parent.get_node("cardback")
	
	$questions.visible = false;
	
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_random_question():
	# Generate a random index within the range of the questions array
	var randomIndex:int = randi() % questions.size()
	
	print(randomIndex)
	# Access the question at the random index
	return questions[randomIndex]
	

		
func _pressed():

	if cardback:
		$questions.visible = false
		var hframes = 20
		cardback.hframes = hframes
		$flipTimer.start();
		
		while $flipTimer.time_left > 0.0:
			cardback.hframes -= 4
			
			if cardback.hframes < 1:
				break;
			print("HFRAMES: ", cardback.hframes)
			#print("Seconds Left: ", seconds_left)
			yield(get_tree().create_timer(0.1), "timeout")
		
		var _q = get_random_question()
		$questions.text = _q
		$questions.visible = true


func _on_flipTimer_timeout():
	if cardback:
		cardback.hframes = 1
	print("TImeout")


func change_texture(new_texture_path):
	if cardback:
		# Load a new texture and set it to the cardback Sprite
		var new_texture = load(new_texture_path)  # Replace 'new_texture_path' with your texture path
		cardback.texture = new_texture
	else:
		print("cardback node not found")
