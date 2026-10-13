extends CanvasLayer

@onready var p1ScoreLabel = $P1ScoreLabel
@onready var p2ScoreLabel = $P2ScoreLabel

func _ready() -> void:
	p1ScoreLabel.text = "0"
	p2ScoreLabel.text = "0"
	GameManager.score_updated.connect(update_labels)

func _process(delta: float) -> void:
	pass

func update_labels(player, new_score):
	if player == 1:
		p1ScoreLabel.text = str(new_score)
	if player == 2:
		p2ScoreLabel.text = str(new_score)
