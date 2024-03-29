extends CharacterBody2D
signal health_depleted
var health = 100.0

	#this is the update function in most other engines
	#runs multiple times per sec
func _physics_process(delta):
	var direction =Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * 600.0
	move_and_slide()
	 
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else: 
		%HappyBoo.play_idle_animation()
	
	const DAMAGE_RATE = 500.0
	var overlapping_mobs = %Hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0:
			health_depleted.emit()
