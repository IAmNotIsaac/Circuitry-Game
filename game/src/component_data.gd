class_name ComponentData


var exact_sides := ComponentSides.new()
var relative_sides := ComponentSides.new()
var _grid_position := Vector2() setget , get_grid_position
var _piece : Component setget set_piece, get_piece
var _board setget set_board, get_board

signal piece_changed(new_piece)
signal grid_position_changed(new_grid_position)


func set_board(board) -> void:
	_board = board


func get_board(): # -> CircuitBoard
	return _board


func set_piece(piece : Component) -> void:
	_piece = piece
	emit_signal("piece_changed", _piece)


func get_piece() -> Component:
	return _piece


func set_grid_position(x : int, y : int) -> void:
	_grid_position = Vector2(x, y)
	emit_signal("grid_position_changed", _grid_position)


func get_grid_position() -> Vector2:
	return _grid_position


func get_class() -> String:
	return "ComponentData"
