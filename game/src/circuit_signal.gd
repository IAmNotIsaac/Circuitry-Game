class_name CircuitSignal
extends Node2D


func logic(board, component : Component, direction : int) -> void:
	if component.get_data().get_relative_sides().get_side_type(direction) == ComponentSides.Types.OUTPUT:
		var offset := Vector2.ZERO
		
		match direction:
			ComponentSides.Directions.TOP: offset = Vector2.UP
			ComponentSides.Directions.BOTTOM: offset = Vector2.DOWN
			ComponentSides.Directions.LEFT:
				offset = Vector2.LEFT
				rotation_degrees = 90
			ComponentSides.Directions.RIGHT:
				offset = Vector2.RIGHT
				rotation_degrees = 90
		
		position = board.globalize_position(component.get_data().get_grid_position() + offset / 2.0)
		
		var adjacent_component : ComponentData = board.get_component(component.get_data().get_grid_position() + offset)
		
		if adjacent_component and adjacent_component.get_relative_sides().get_side_type(ComponentSides.flip_direction(direction)) == ComponentSides.Types.INPUT:
			var new_dirs := adjacent_component.sparked()
			
			for new_direction in new_dirs:
				board.spark(adjacent_component.get_piece(), new_direction)
