extends Node2D

# Game states
enum GameState {
	NOT_PLAYING,
	PLAYING, 
	WON,
	LOST
}

var game_state: GameState = GameState.NOT_PLAYING

func start_game():
	game_state = GameState.PLAYING
	
func lose_game():
	game_state = GameState.LOST
	
func won_game():
	game_state = GameState.WON
	
func is_game_over() -> bool:
	return game_state == GameState.WON or game_state == GameState.LOST
