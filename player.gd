extends CharacterBody2D

var health = 100.0

	#this is the update function in most other engines
	#runs multiple times per sec
func _physics_process(delta):
	var direction =Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * 400.0
	move_and_slide()
	 
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else: 
		%HappyBoo.play_idle_animation()
