class_name ComponentDisplay
extends Node2D


const PATH_ANIMATIONS = {
	ComponentSides.Types.NONE : "default",
	ComponentSides.Types.INPUT : "input",
	ComponentSides.Types.OUTPUT : "output",
	ComponentSides.Types.DEBUG1 : "debug",
	ComponentSides.Types.DEBUG2 : "debug",
	ComponentSides.Types.DEBUG3 : "debug",
	ComponentSides.Types.DEBUG4 : "debug",
}

onready var top := $Top
onready var bottom := $Bottom
onready var left := $Left
onready var right := $Right


#func _ready() -> void:
#	var comp_data := ComponentData.new()
#	var sides := ComponentSides.new(
#		ComponentSides.Types.NONE, # top
#		ComponentSides.Types.INPUT, # bottom
#		ComponentSides.Types.OUTPUT, # left
#		ComponentSides.Types.OUTPUT # right
#	)
#	comp_data.set_sides(sides)
#
#	while true:
#		match_data(comp_data)
#
#		yield(get_tree().create_timer(4), "timeout")
#
#		comp_data.shift(1)


func match_data(data : ComponentData) -> void:
	top.play(PATH_ANIMATIONS[data.get_relative_sides().top])
	bottom.play(PATH_ANIMATIONS[data.get_relative_sides().bottom])
	left.play(PATH_ANIMATIONS[data.get_relative_sides().left])
	right.play(PATH_ANIMATIONS[data.get_relative_sides().right])


#func set_side(side : int, type : int) -> void:
#	match side:
#		ComponentSides.Directions.TOP: $Top.play(PATH_ANIMATIONS[type])
#		ComponentSides.Directions.BOTTOM: $Bottom.play(PATH_ANIMATIONS[type])
#		ComponentSides.Directions.LEFT: $Left.play(PATH_ANIMATIONS[type])
#		ComponentSides.Directions.RIGHT: $Right.play(PATH_ANIMATIONS[type])
