extends Node

signal score_updated(player, new_score)

var p1_score: int = 0
var p2_score: int = 0

func update_score(player: int):
	if player == 1:
		p1_score += 1
		score_updated.emit(1, p1_score)
	else:
		p2_score += 1
		score_updated.emit(2, p2_score)
