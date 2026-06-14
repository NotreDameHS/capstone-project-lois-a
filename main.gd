extends CanvasLayer
@onready var distance_label: Label = $DistanceLabel
@onready var restart_button: Button = $RestartButton
@onready var health_bar: ProgressBar = $HealthBar

var total_survival_score: float = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	restart_button.visible = false
	health_bar.max_value = 100.0
	health_bar.value = 100.0

#connect to game manager
	GameManager.game_over_triggered.connect(_on_game_over)
	restart_button.pressed.connect(GameManager.reset_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not GameManager.is_game_over:
		total_survival_score += 15.0 * delta  # caculates 15 meters traveled per second
		distance_label.text = str(int(total_survival_score)) + "m"


func update_health_bar(new_health: float, max_health: float):
	health_bar.max_value = max_health
	health_bar.value = new_health

func get_final_score() -> int:
	return int(total_survival_score)


func _on_game_over() -> void:
	# This function triggers automatically when GameManager.emit()runs
	
	# takes the score that was saved in the GameManager variable
	var score = GameManager.final_distance_recorded
	
	# Display the text and reveal the hidden button
	distance_label.text = "GAME OVER\nYou Survived: " + str(score) + "m"
	restart_button.visible = true
