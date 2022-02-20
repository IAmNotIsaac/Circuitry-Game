class_name SpecializedArray


var specialty = null
var items := []
var _iter_idx = 0


# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
func _init(specialty = null, items := []) -> void:
	self.specialty = specialty
	
	if _all_items_specialty(items, specialty):
		self.items = items
	else:
		pass
		# TODO: error handling


func append(item) -> void:
	if item is specialty:
		items.append(item)
	else:
		pass
		# TODO: error handling


func append_array(comp_array) -> void:
	if _all_items_specialty(comp_array.items, specialty):
		items.append_array(comp_array.items)
	else:
		pass
		# TODO: error handling


func empty() -> bool:
	return items.empty()


func insert(idx : int, item) -> void:
	if item is specialty:
		items.insert(idx, item)
	else:
		pass
		# TODO: error handling


func invert() -> void:
	items.invert()


func push_back(item) -> void:
	if item is specialty:
		items.push_back(item)
	else:
		pass
		# TODO: error handling


func remove(idx : int) -> void:
	items.remove(idx)


func resize(idx : int) -> void:
	items.resize(idx)


func get_idx(idx : int):
	return items[idx]


func set_idx(idx : int, item) -> void:
	if item is specialty:
		items[idx] = item
	else:
		pass
		# TODO: error handling


func size() -> int:
	return items.size()


func erase(item) -> void:
	if item is specialty:
		items.erase(item)
	else:
		pass
		# TODO: error handling


func find(item) -> int:
	if item is specialty:
		return items.find(item)
	return -1
	# TODO: error handling


func has(item) -> bool:
	if item is specialty:
		return item in items
	return false
	# TODO: error handling


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


func _iter_get(_arg):
	return items[_iter_idx]


# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
static func _all_items_specialty(items : Array, specialty) -> bool:
	for item in items:
		if not (item is specialty): return false
	return true
