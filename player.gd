extends CharacterBody2D


@export var max_health: float = 100
@export var base_speed: float = 300  
@onready var health_bar: ProgressBar = $ProgressBar
var current_speed: float



func _ready() -> void:
	current_speed = base_speed

func _physics_process(delta: float) -> void:
	#input mapping
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * current_speed
	move_and_slide()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
func _process(delta: float) -> void:
	pass
