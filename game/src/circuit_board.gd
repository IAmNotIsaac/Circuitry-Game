extends Node2D


var size := Vector2.ONE
var components : ComponentArray = ComponentArray.new()


func _ready() -> void:
	var sides = ComponentSides.new(
		ComponentSides.Types.DEBUG1,
		ComponentSides.Types.DEBUG3,
		ComponentSides.Types.DEBUG4,
		ComponentSides.Types.DEBUG2
	)
	
	DebugTools.print_sides(sides)
	
#	add_component(null, Vector2.ZERO)


func add_component(comp_data : ComponentData, comp_position : Vector2) -> void:
	components.append(comp_data)


func remove_component(comp_data : ComponentData) -> void:
	components.erase(comp_data)


func get_component(comp_position : Vector2) -> Object:
	return Node2D.new()
