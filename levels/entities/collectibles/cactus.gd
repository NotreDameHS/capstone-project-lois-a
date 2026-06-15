extends Hazard

@export var spike_scene: PackedScene = preload("res://levels/entities/collectibles/spike.tscn")

@onready var shoot_timer: Timer = $ShootTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect the internal collision so if the player hits the cactus body, they take damage
	body_entered.connect(_on_body_entered)
	shoot_timer.timeout.connect(_on_shoot_timer_timeout)
	_on_shoot_timer_timeout()  #fires immediately


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_shoot_timer_timeout() -> void:
	if GameManager.is_game_over:
		return

	# Find where the player is currently floating on the screen
	var player = get_tree().current_scene.get_node_or_null("Player")
	
	if player != null and spike_scene != null:
		# make a brand new Spike 
		var new_spike = spike_scene.instantiate()
		new_spike.global_position = global_position
		var launch_direction = (player.global_position - global_position).normalized()
		new_spike.set_launch_direction(launch_direction)
		#Add the spike into the main scene moves
		get_tree().current_scene.add_child(new_spike)


#when the player catches into the cactus
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and body.has_method("take_damage"):
		body.take_damage(20.0) # Direct crash damage
		queue_free()


		
