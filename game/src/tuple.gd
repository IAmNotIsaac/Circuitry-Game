class_name Tuple


class TupleBuiltin:
	var representation : int
	
	func _init(representation : int) -> void:
		self.representation = representation

enum Builtins { INT, FLOAT, STRING, ARRAY }

var specialties := []
var items := []
var _iter_idx := 0


func _init(specialties := [], items := []) -> void:
	self.specialties = specialties
	self.items.resize(len(self.specialties))


func set_idx(idx : int, item) -> void:
	if _matches_type(idx, item):
		items[idx] = item


func get_idx(idx : int):
	return items[idx]


func to_gd_array() -> Array:
	return items


func _matches_type(idx : int, item) -> bool:
	if item is specialties[idx]:
		return true
	elif item is TupleBuiltin:
		match item.representation:
			Builtins.INT: return item is int
			Builtins.FLOAT: return item is float
			Builtins.STRING: return item is String
			Builtins.ARRAY: return item is Array
	return false


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
