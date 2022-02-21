class_name CircuitBoard
extends Node2D


var size := Vector2(10, 5)
var components : SpecializedArray = SpecializedArray.new(ComponentData)
var signals : SpecializedArray = SpecializedArray.new(CircuitSignal)


func _ready() -> void:
# warning-ignore:return_value_discarded
	var data1 = ComponentData.new()
	var sides1 = ComponentSides.new(
		ComponentSides.Types.INPUT,
		ComponentSides.Types.NONE,
		ComponentSides.Types.OUTPUT,
		ComponentSides.Types.OUTPUT
	); data1.set_sides(sides1)
	
	var data2 = ComponentData.new()
	var sides2 = ComponentSides.new(
		ComponentSides.Types.OUTPUT
	); data2.set_sides(sides2)
	
	var data3 = ComponentData.new()
	var sides3 = ComponentSides.new(
		ComponentSides.Types.INPUT
	); data3.set_sides(sides3)
	
	var data4 = ComponentData.new()
	var sides4 = ComponentSides.new(
		ComponentSides.Types.INPUT
	); data4.set_sides(sides4)
	
	var comp1 = add_component(data1, Vector2(1, 1)); comp1.shift(1)
	var comp2 = add_component(data2, Vector2(2, 1)); comp2.shift(-1)
	var comp3 = add_component(data3, Vector2(1, 0)); comp3.shift(2)
	var comp4 = add_component(data4, Vector2(1, 2)); comp4.shift(0)
	
	spark_component(comp2)


func _input(event : InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		remove_component(localize_position(get_global_mouse_position()))


# returns placed component
func add_component(comp_data : ComponentData, comp_position : Vector2) -> Component:
	if get_component(comp_position) == null and is_local_within_bounds(comp_position):
		var piece : Component = Global.instances.COMPONENT.instance()
		add_child(piece)
		
		comp_data.set_piece(piece)
		comp_data.set_board(self)
		piece.set_data(comp_data)
		piece.set_board(self)
		
		comp_data.set_grid_position(int(comp_position.x), int(comp_position.y))
		
		components.append(comp_data)
		
		return piece
	
	return null


func remove_component(comp_position : Vector2) -> ComponentData:
	var target = get_component(comp_position)
	
	if target:
		target.get_piece().queue_free()
		target.set_board(null)
		target.set_piece(null)
		components.erase(target)
	
	return target


func get_component(comp_position : Vector2) -> ComponentData:
	for comp in components:
		if comp.get_grid_position() == comp_position:
			return comp
	
	return null


func localize_position(pos : Vector2) -> Vector2:
	var res = pos / Component.COMPONENT_SIZE - Vector2(0.5, 0.5)
	
	res.x = round(res.x)
	res.y = round(res.y)
	
	return res


func globalize_position(pos : Vector2) -> Vector2:
	var res = pos * Component.COMPONENT_SIZE + Component.COMPONENT_SIZE / 2.0
	
	return res


func bound_local_position(pos : Vector2) -> Vector2:
	pos.x = clamp(pos.x, 0.0, size.x)
	pos.y = clamp(pos.y, 0.0, size.y)
	
	return pos


func is_local_within_bounds(pos : Vector2) -> bool:
	if pos.x >= 0.0 and pos.x < size.x and pos.y >= 0.0 and pos.y < size.y:
		return true
	return false


func spark(component : Component, direction : int) -> void:
	var signal_ : CircuitSignal = Global.instances.SIGNAL.instance()
	
	add_child(signal_)
	
	signal_.logic(self, component, direction)


func spark_component(component : Component) -> void:
	for direction in component.get_data().get_output_directions():
		spark(component, direction)


#func spark(component : Component) -> void:
#	for side_and_type in component.get_data().get_relative_sides().get_sides_and_types():
#		var side : int = side_and_type.get_idx(0)
#		var type : int = side_and_type.get_idx(1)
#
#		if type == ComponentSides.Types.OUTPUT:
#			var offset = Vector2.ZERO
#
#			match side:
#				ComponentSides.Directions.TOP: offset = Vector2.UP
#				ComponentSides.Directions.BOTTOM: offset = Vector2.DOWN
#				ComponentSides.Directions.LEFT: offset = Vector2.LEFT
#				ComponentSides.Directions.RIGHT: offset = Vector2.RIGHT
#
#			var adjacent_component := get_component(component.get_data().get_grid_position() + offset)
#
#			if adjacent_component and adjacent_component.get_relative_sides().get_side_type(ComponentSides.flip_direction(side)) == ComponentSides.Types.INPUT:
#				var signal_ = Global.instances.SIGNAL.instance()
#				add_child(signal_)
#
#				signal_.set_position(globalize_position(component.get_data().get_grid_position() + offset / 2.0))
#
#				if side in [ComponentSides.Directions.LEFT, ComponentSides.Directions.RIGHT]:
#					signal_.set_rotation_degrees(90)
#
#					spark(adjacent_component.get_piece())
#					signal_.queue_free()
