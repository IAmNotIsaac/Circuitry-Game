extends Node2D


var size := Vector2.ONE
var components : ComponentArray = ComponentArray.new()


func _ready() -> void:
	components.append(ComponentData.new())
	components.append(ComponentData.new())
	components.append(ComponentData.new())
	
	for component in components:
		print(component)


func add_component(comp_data : ComponentData, comp_position : Vector2) -> void:
	components.append(comp_data)


func remove_component(comp_data : ComponentData) -> void:
	components.erase(comp_data)


func get_component(comp_position : Vector2) -> Object:
	for component in components:
		pass
	
	return Node2D.new()
