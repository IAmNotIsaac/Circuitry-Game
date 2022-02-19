class_name ComponentArray


var items := []


func append(c_data : ComponentData) -> void:
	items.append(c_data)


func erase(c_data : ComponentData) -> void:
	items.erase(c_data)


func find(c_data : ComponentData) -> int:
	return items.find(c_data)
