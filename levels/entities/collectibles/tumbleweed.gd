extends Hazard
class_name Tumbleweed

@export var rotation_speed: float = 5.0
@onready var direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	base_speed = 200.0
	damage = 25
	direction = Vector2(-1, 0) # Moves left



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
	
	# Handle the movement
	position += direction * base_speed * delta
	
	# Handle the visual spin
	rotation += rotation_speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and body.has_method("take_damage"):
		body.take_damage(25.0) 
		queue_free()
