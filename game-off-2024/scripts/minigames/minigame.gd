extends Node2D

# Game states
enum GameState {
	NOT_PLAYING,
	PLAYING, 
	WON,
	LOST
}

enum Level {
	EASY, 
	MEDIUM,
	HARD,
	COMPLETE
}

var game_state: GameState = GameState.NOT_PLAYING
var level: Level

func start_game() -> void:
	game_state = GameState.PLAYING
	
func lose_game() -> void:
	game_state = GameState.LOST
	
func won_game() -> void:
	game_state = GameState.WON

func reset_game() -> void:
	pass
	
func is_won() -> bool:
	return game_state == GameState.WON

func is_lost() -> bool:
	return game_state == GameState.LOST
	
func is_over() -> bool:
	return is_won() or is_lost()
	
func set_level(new_level) -> void:
	level = new_level
	
static func next_level(current_level: Level) -> Level:
	match current_level:
		Level.EASY:
			return Level.MEDIUM
		Level.MEDIUM:
			return Level.HARD
		Level.HARD:
			return Level.COMPLETE
		Level.COMPLETE:
			return Level.COMPLETE
		_:
			return Level.COMPLETE
