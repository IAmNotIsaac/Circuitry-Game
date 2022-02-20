class_name ComponentDisplay
extends Node2D


const PATH_ANIMATIONS = {
	ComponentSides.Types.NONE : "default",
	ComponentSides.Types.INPUT : "input",
	ComponentSides.Types.OUTPUT : "output",
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
