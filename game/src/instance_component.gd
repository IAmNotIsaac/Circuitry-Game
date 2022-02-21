tool
class_name ComponentInstance
extends Node2D


export(ComponentSides.Types) var default_top = ComponentSides.Types.NONE setget set_top
export(ComponentSides.Types) var default_bottom = ComponentSides.Types.NONE setget set_bottom
export(ComponentSides.Types) var default_left = ComponentSides.Types.NONE setget set_left
export(ComponentSides.Types) var default_right = ComponentSides.Types.NONE setget set_right


func set_top(new : int) -> void:
	default_top = new
	$Top.play(ComponentDisplay.PATH_ANIMATIONS[default_top])


func set_bottom(new : int) -> void:
	default_bottom = new
	$Bottom.play(ComponentDisplay.PATH_ANIMATIONS[default_bottom])


func set_left(new : int) -> void:
	default_left = new
	$Left.play(ComponentDisplay.PATH_ANIMATIONS[default_left])


func set_right(new : int) -> void:
	default_right = new
	$Right.play(ComponentDisplay.PATH_ANIMATIONS[default_right])

