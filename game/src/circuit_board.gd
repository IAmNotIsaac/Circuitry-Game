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
	
	for _i in 4:
		sides.d_print()
		sides.shift(1)
		print("")
	
#	add_component(null, Vector2.ZERO)


func add_component(c_data : ComponentData, comp_position : Vector2) -> void:
	components.append(c_data)


func remove_component(c_data : ComponentData) -> void:
	components.erase(c_data)


func get_component(comp_position : Vector2) -> Object:
	return Node2D.new()
