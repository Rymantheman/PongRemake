extends CanvasLayer

@onready var p1ScoreLabel = $P1ScoreLabel
@onready var p2ScoreLabel = $P2ScoreLabel

func _ready() -> void:
	p1ScoreLabel.text = "0"
	p2ScoreLabel.text = "0"

func _process(delta: float) -> void:
	print(GameManager.p1_score)


func _on_left_goal_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
