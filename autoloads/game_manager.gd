extends Node
# the custom signal for when game over is triggered
signal game_over_triggered

var is_game_over: bool = false
var game_difficulty: float = 1.0
var final_distance_recorded: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func trigger_game_over(distance: int) -> void:
	if is_game_over: 
		return 
		is_game_over = true
		final_distance_recorded = distance #Saves the distance score into our global variable so the UI can read it later

		
		get_tree().paused = true # Instantly freezes all gameplay physics, movement vectors...
		game_over_triggered.emit()

func reset_game() -> void:
	# Reset all of the tracking variables back to their default settings

	is_game_over = false
	game_difficulty = 1.0
	final_distance_recorded = 0
	get_tree().paused = false  ## Unfreezes the game world 
	get_tree().reload_current_scene()  #completely wipes the current active scene from memory and load a brand instance of the game
