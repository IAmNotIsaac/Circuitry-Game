class_name ComponentSides


enum Types {
	NONE, INPUT, OUTPUT, DEBUG1, DEBUG2, DEBUG3, DEBUG4
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
			last_sides[wrapi(i - count, -4, 4)]
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


# Returns list of tuples (direction, type)
func get_sides_and_types() -> SpecializedArray:
	var result := SpecializedArray.new(Tuple)
	
	for direction in [Directions.TOP, Directions.BOTTOM, Directions.LEFT, Directions.RIGHT]:
		result.append(
			Tuple.new(
				[Tuple.Builtins.INT, Tuple.Builtins.INT],
				[direction, get_side_type(direction)]
			)
		)
	
	return result


func get_class() -> String:
	return "ComponentSides"


static func flip_direction(direction : int) -> int:
	match direction:
		Directions.TOP: return Directions.BOTTOM
		Directions.BOTTOM: return Directions.TOP
		Directions.LEFT: return Directions.RIGHT
		Directions.RIGHT: return Directions.LEFT
	return -1
	# TODO: error handling


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
