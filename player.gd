extends CharacterBody2D


@export var max_health: float = 100

@onready var health_bar: ProgressBar = $ProgressBar


func _physics_process(delta: float) -> void:
	pass

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
func _process(delta: float) -> void:
	var direction := Vector2(0, 0)
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
