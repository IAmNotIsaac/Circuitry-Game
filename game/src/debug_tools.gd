class_name DebugTools
extends Node


# Prints an enum value's name
static func evn(enum_: Dictionary, value : int) -> String:
	return enum_.keys()[value]


# Print a fancy and formatted version of ComponentSides
static func print_sides(comp_sides : ComponentSides) -> void:
	var top_n = evn(ComponentSides.Types, comp_sides.top)
	var bottom_n = evn(ComponentSides.Types, comp_sides.bottom)
	var left_n = evn(ComponentSides.Types, comp_sides.left)
	var right_n = evn(ComponentSides.Types, comp_sides.right)
	
	var left_size = len(left_n)
	var middle_size = max(len(top_n), len(bottom_n))
	
	# print first row
	print(" ".repeat(left_size), top_n)
	# print middle row
	print(left_n, " ".repeat(middle_size), right_n)
	# print last row
	print(" ".repeat(left_size), bottom_n)
