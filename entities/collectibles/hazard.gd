extends Area2D
class_name Hazard

@export var damage: float = 15.0
@export var base_speed: float = 150


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_body_entered(body: Node) -> void:
	# We check if the thing that walked into us is named Player
	if body.name == "Player":
		# If it is the player, tell them to run their take_damage function!
		if body.has_method("take_damage"):
			body.take_damage(damage)
			queue_free()	
 
