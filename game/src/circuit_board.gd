class_name CircuitBoard
extends Node2D


var size := Vector2(10, 5)
var components : ComponentArray = ComponentArray.new()


func _ready() -> void:
# warning-ignore:return_value_discarded
	var data = ComponentData.new()
	var sides = ComponentSides.new(
		ComponentSides.Types.INPUT
	)
	data.set_sides(sides)
	add_component(data, Vector2(2, 2)).shift(1)
	add_component(DevTools.copy_class(data), Vector2(3, 2)).shift(-2)


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


func get_component(comp_position : Vector2) -> Object:
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
