extends Node

var scene = ""
var loading_scene = "res://scenes/loading.tscn"

var questions = ["Who made the first move?", "When did you first know you were in love with your partner?",
		"Who is more jealous, you or your partner?", "Who controls the finances in your relationship?", "Who initiates sex more often, you or your partner?", 
		"Who is more likely to get emotional during an argument?", "Who is more of a social butterfly, you or your partner?", 
		"Who takes the longest to get ready in the morning?", "Who is more likely to say “I love you”?", "Who is the better cook?", 
		"Who is more likely to give in during an argument?", "Who picks up after themselves more, you or your partner?", 
		"Who takes care of the household chores?", "Who is more independent?", "Do you and your partner have similar interests?", 
		"What is your partner’s most annoying habit?", "What is your partner’s biggest insecurity?", "What do you think your partner’s ideal date would be?", 
		"What are your partner’s bad habits?", "When was the last time you argued?", "Who apologizes first after an argument?", 
		"What do you think is the best thing about your partner?", "Are you comfortable with your partner seeing you naked?", 
		"What was your first impression of your partner?", "What are your partner’s parents like?", "How often does your partner want sex?", 
		"What are your partner’s turn-ons?", "What is your partner’s biggest fear?", "Who is more stubborn, you or your partner?", 
		"How often do you have sex?", "Who is the laziest in the relationship?", "Who was your first crush, and what were they like?", 
		"Can you describe what your first heartbreak was like?", "What was the biggest lesson from your worst breakup?", "What do you find sexiest about me?", 
		"Have you ever been cheated on?", "Who is more trusting, you or me?", "Who is more inclined to be jealous, you or me?", 
		"What's the first thing you noticed about me?", "What's the first thing you found attractive about me?", "Would you rather be an amazing singer, or an incredible dancer?", 
		"What superpower do you wish you could have?", "If we could have sex anywhere, where would you choose?", "Would you rather have only morning sex for the rest of your life, or strictly sex at night?", 
		"How do you define great sex?", "When did you first want to kiss me?", "What's your favorite sex position?", 
		"Where would you like to be touched more often?", "What's something you wish we did together more often?", "Who is more likely to survive the Hunger Games—me or you?", 
		"Who was your first celebrity crush?", "Which of us has a better sense of direction?", "Do you think of yourself as an optimist, or a pessimist?", 
		"Which song describes our love story best", "Is there a song that makes you think of me?", "What's a song you could sing by heart to me, right now?", 
		"How many times have you been in love?", "Have you ever been in a physical fight?", "Is there a personal goal you'd like to achieve in the next five years or so?", 
		"Is there a place that you love that you'd like to show me one day?", "How much do you love me?", "Is there anything you've always wondered about me, but have hesitated to ask?", 
		"What's one of my best qualities?", "What makes you hate a person?", "What’s a romantic vacation like for you?", "What opportunities did you miss out on in life?"
		, "Do you consider yourself to be a forgiver?", "Have you ever dated someone who is older than you?", "What activities would you like to do for our next date?", 
		"Are you someone who forgets people’s names easily?", "What kind of physical touch best expresses your feelings for me?", "If you could change one thing about me, what do you think would it be?", 
		"If you could change one thing about me, what do you think would it be?", "What do you love most about our relationship?", "What are the three things we have in common?", 
		"How do you actually feel whenever I hug you?", "What if we can't agree on something important that both of us are involved in?", 
		"What’s one question you never really asked me?", "What’s the perfect advice you could give me right now?", "What would you do with or for me that you haven't been able to do in previous relationships?", 
		"If you want to change something in your life, what would it be?", "What is something you feel our relationship is lacking?", "Even if it's for me, can you name one thing you can't give up?", 
		"What do you think will ruin this relationship?", "What was the first thing that came to mind when you noticed me?", "What is the most memorable part you have of our first kiss?", 
		"What does a perfect date night look like to you?", "If you knew today would be our last, how would you like us to spend it?", "What memories do you want us to recreate together?", 
		"What was the last thing I did that totally impressed you?", "If someone tries to break us apart, what would you do?", 
		"How do you want to celebrate Valentine’s Day?", "If you could describe our relationship in three words, what would it be?", 
		"Which Disney character was your most favorite?", "What’s your favorite date night we ever had?"]
		

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		get_tree().quit()
