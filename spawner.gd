extends Node2D

@export var cactus_scene: PackedScene = preload("res://levels/entities/collectibles/cactus.tscn")
@export var tumbleweed_scene: PackedScene = preload("res://levels/entities/collectibles/tumbleweed.tscn")

@onready var spawn_timer: Timer = $SpawnTimer
var screen_size: Vector2

func _ready() -> void:
	screen_size = get_viewport_rect().size
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	spawn_timer.start()

func _on_spawn_timer_timeout() -> void:
	if GameManager.is_game_over:
		return
#Pick a random side of the screen edge to drop the hazard 
	var new_hazard = cactus_scene.instantiate() if randi() % 2 == 0 else tumbleweed_scene.instantiate()
	var edge = randi() % 4
	var spawn_pos := Vector2.ZERO
	spawn_pos = Vector2(randf_range(0, screen_size.x), -50)
	spawn_pos = Vector2(randf_range(0, screen_size.x), screen_size.y + 50)
	spawn_pos = Vector2(-50, randf_range(0, screen_size.y))
	spawn_pos = Vector2(screen_size.x + 50, randf_range(0, screen_size.y))
	
	new_hazard.global_position = spawn_pos
	get_tree().current_scene.add_child(new_hazard)
