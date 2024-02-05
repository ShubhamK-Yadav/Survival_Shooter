extends CharacterBody2D

var health = 3
@onready var player = get_node("/root/Game/Player")

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()

func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	if health == 0:
		queue_free()
		const smoke_scene = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = smoke_scene.instantiate()
		#makes the smoke a sibling instead of a child
		#this is neccessary if the smoke was a child of mob it would disappear when it dies
		get_parent().add_child(smoke)
		smoke.global_position = global_position
