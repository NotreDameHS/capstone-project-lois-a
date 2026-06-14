extends CharacterBody2D


@export var max_health: float = 100
@export var base_speed: float = 300 
@onready var health_bar: ProgressBar = $ProgressBar
var current_speed: float
var current_health: float
var screen_size: Vector2

@onready var speed_boost_timer: Timer = $SpeedBoostTimer





func _ready() -> void:
	current_speed = base_speed
	current_health = max_health
	screen_size = get_viewport_rect().size
	
#connect the countdown to the speeedstar
	speed_boost_timer.timeout.connect(_on_speed_boost_timeout)


func _physics_process(delta: float) -> void:
	#freeze input vectors if the game is finished
	if GameManager.is_game_over:
		velocity = Vector2.ZERO
		return
	
	#input mapping
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * current_speed
	move_and_slide()  #moves the player using its velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)

func _process(delta: float) -> void:
	pass


func _on_speed_boost_timeout() -> void:
	current_speed = base_speed	
	
	
func take_damage(amount: float) -> void:
	if GameManager.is_game_over:
		return
		
	current_health = max(current_health - amount, 0.0)
	var main_ui = get_tree().current_scene.get_node_or_null("Main")
	if main_ui != null:
		main_ui.update_health_bar(current_health, max_health)
		
	if current_health <= 0.0:
		#
		var main_ui_node = get_tree().current_scene.get_node_or_null("Main")
		var score: int
		if main_ui_node != null:
			score = main_ui_node.get_final_score()
		else:
			score = 0



func apply_speed_boost() -> void:  #to track the speedstar
	current_speed = base_speed * 1.5  # 50% velocity upgrade
	speed_boost_timer.start()      # Set clock straight to 20 seconds
