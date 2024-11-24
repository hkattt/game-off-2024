extends Node2D

# Game states
enum GameState {
	NOT_PLAYING,
	PLAYING, 
	WON,
	LOST
}

enum Difficulty {
	EASY, 
	MEDIUM,
	HARD
}

var game_state: GameState = GameState.NOT_PLAYING
var difficulty: Difficulty

func start_game():
	game_state = GameState.PLAYING
	
func lose_game():
	game_state = GameState.LOST
	
func won_game():
	game_state = GameState.WON
	
func is_game_over() -> bool:
	return game_state == GameState.WON or game_state == GameState.LOST

func set_difficulty(difficulty: Difficulty):
	difficulty = difficulty
	
func next_difficulty():
	match difficulty:
		Difficulty.EASY:
			return Difficulty.MEDIUM
		Difficulty.MEDIUM:
			return Difficulty.HARD
		Difficulty.HARD:
			return Difficulty.EASY
