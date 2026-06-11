extends Hazard
@export var speed: float = 400.0
var direction: Vector2 = Vector2(-1, 0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	if position.x < -50:    # Automatically delete spike if it leaves the screen 	
		queue_free()


func _on_body_entered(body: Node):
	if body.is_in_group("player"):
		body.take_damage(15)
		queue_free()       
