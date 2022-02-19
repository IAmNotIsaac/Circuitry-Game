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


func evn(enum_: Dictionary, value : int) -> String:
	return enum_.keys()[value]


func d_print() -> void:
	var top_n = evn(Types, top)
	var bottom_n = evn(Types, bottom)
	var left_n = evn(Types, left)
	var right_n = evn(Types, right)
	
	var left_size = len(left_n)
	var middle_size = max(len(top_n), len(bottom_n))
	
	# print first row
	print(" ".repeat(left_size), top_n)
	# print middle row
	print(left_n, " ".repeat(middle_size), right_n)
	# print last row
	print(" ".repeat(left_size), bottom_n)


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
