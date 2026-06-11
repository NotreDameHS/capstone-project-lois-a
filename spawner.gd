extends Node2D

@export var cactus_scene: PackedScene = preload("res://levels/entities/collectibles/cactus.tscn")
@export var tumbleweed_scene: PackedScene = preload("res://levels/entities/collectibles/tumbleweed.tscn")

@onready var spawn_timer: Timer = $SpawnTimer
var screen_size: Vector2

func _ready() -> void:
	screen_size = get_viewport_rect().size
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)

func _on_spawn_timer_timeout() -> void:
	if GameManager.is_game_over:
		return
