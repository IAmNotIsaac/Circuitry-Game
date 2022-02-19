class_name ComponentArray


var items := []
var _iter_idx = 0


# warning-ignore:shadowed_variable
func _init(items := []) -> void:
	if _all_items_components(items):
		self.items = items
	else:
		pass
		# TODO: error handling


func append(comp_data : ComponentData) -> void:
	items.append(comp_data)


func append_array(comp_array : ComponentArray) -> void:
	if _all_items_components(comp_array.items):
		items.append_array(comp_array.items)
	else:
		pass
		# TODO: error handling


func empty() -> bool:
	return items.empty()


func insert(idx : int, comp_data : ComponentData) -> void:
	items.insert(idx, comp_data)


func invert() -> void:
	items.invert()


func push_back(comp_data : ComponentData) -> void:
	items.push_back(comp_data)


func remove(idx : int) -> void:
	items.remove(idx)


func resize(idx : int) -> void:
	items.resize(idx)


func get_idx(idx : int) -> ComponentData:
	return items[idx]


func set_idx(idx : int, comp_data : ComponentData) -> void:
	items[idx] = comp_data


func size() -> int:
	return items.size()


func erase(comp_data : ComponentData) -> void:
	items.erase(comp_data)


func find(comp_data : ComponentData) -> int:
	return items.find(comp_data)


func has(comp_data : ComponentData) -> bool:
	return comp_data in items


func get_class() -> String:
	return "ComponentArray"


func _to_string() -> String:
	return str(items)


func _iter_init(_arg) -> bool:
	_iter_idx = 0
	if _iter_idx < len(items):
		return true
	return false


func _iter_next(_arg) -> bool:
	_iter_idx += 1
	if _iter_idx < len(items):
		return true
	return false


func _iter_get(_arg) -> ComponentData:
	return items[_iter_idx]


# warning-ignore:shadowed_variable
static func _all_items_components(items : Array) -> bool:
	for item in items:
		if not (item is ComponentData): return false
	return true
