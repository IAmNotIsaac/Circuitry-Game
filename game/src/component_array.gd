class_name ComponentArray


var items := []


func append(comp_data : ComponentData) -> void:
	items.append(comp_data)


func erase(comp_data : ComponentData) -> void:
	items.erase(comp_data)


func find(comp_data : ComponentData) -> int:
	return items.find(comp_data)
