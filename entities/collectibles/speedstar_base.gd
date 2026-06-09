extends Area2D
class_name SpeedstarBase

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_base_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_base_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.is_in_group("player"):
		apply_upgrade(body)
		
func apply_upgrade(player: Node2D) -> void:
	queue_free()
