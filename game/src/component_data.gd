class_name ComponentData


var exact_sides := ComponentSides.new() setget set_sides, get_exact_sides
var relative_sides := ComponentSides.new() setget set_sides, get_relative_sides
var _grid_position := Vector2() setget , get_grid_position
var _piece : Component setget set_piece, get_piece
var _board setget set_board, get_board

signal piece_changed(new_piece)
signal grid_position_changed(new_grid_position)


func shift(amount : int) -> void:
	relative_sides.shift(amount)


func set_sides(sides : ComponentSides) -> void:
	exact_sides = sides
	relative_sides = DevTools.copy_class(exact_sides)


func get_exact_sides() -> ComponentSides:
	return exact_sides


func get_relative_sides() -> ComponentSides:
	return relative_sides


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


func get_output_directions() -> PoolIntArray:
	var result : PoolIntArray = []
	
	for side_and_type in relative_sides.get_sides_and_types():
		if side_and_type.get_idx(1) == ComponentSides.Types.OUTPUT:
			result.append(side_and_type.get_idx(0))
	
	return result


func sparked() -> PoolIntArray:
	return get_output_directions()


func get_class() -> String:
	return "ComponentData"
