class_name ComponentSides


enum Types {
	INPUT, OUTPUT, NONE, DEBUG1, DEBUG2, DEBUG3, DEBUG4
}

enum Directions {
	TOP, BOTTOM, LEFT, RIGHT
}


var top : int
var bottom : int
var left : int
var right : int


# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
# warning-ignore:shadowed_variable
func _init(top := Types.NONE, bottom := Types.NONE, left := Types.NONE, right := Types.NONE) -> void:
	self.top = top
	self.bottom = bottom
	self.left = left
	self.right = right


func shift(count : int) -> void:
	var last_sides := [top, right, bottom, left]
	
	for i in 4:
		set_side_type(
			[Directions.TOP, Directions.RIGHT, Directions.BOTTOM, Directions.LEFT][i],
			last_sides[i - wrapi(count, -len(Types), len(Types))]
		)


func set_side_type(direction : int, type : int) -> void:
	match direction:
		Directions.TOP: top = type
		Directions.BOTTOM: bottom = type
		Directions.LEFT: left = type
		Directions.RIGHT: right = type


func get_side_type(direction : int) -> int:
	match direction:
		Directions.TOP: return top
		Directions.BOTTOM: return bottom
		Directions.LEFT: return left
		Directions.RIGHT: return right
	
	# TODO: return error
	return -1


func get_class() -> String:
	return "ComponentSides"


# Start:
#	  D1
#	D4  D2
#	  D3
# [D1, D2, D3, D4]
#
# Goal:
#	  D4
#	D3  D1
#	  D2
# [D4, D1, D2, D3]
