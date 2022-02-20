class_name Component
extends Node2D


signal data_changed(new_data)
signal board_changed(new_board)

const COMPONENT_SIZE := Vector2(64, 64)

export(ComponentSides.Types) var default_top = ComponentSides.Types.NONE
export(ComponentSides.Types) var default_bottom = ComponentSides.Types.NONE
export(ComponentSides.Types) var default_left = ComponentSides.Types.NONE
export(ComponentSides.Types) var default_right = ComponentSides.Types.NONE

var _data setget set_data, get_data #: ComponentData
var _board setget set_board, get_board #: CircuitBoard

onready var component_display := $ComponentDisplay


func _ready() -> void:
	var default_sides := ComponentSides.new(
		default_top,
		default_bottom,
		default_left,
		default_right
	)
	var default_data = DevTools.new_class("ComponentData")
	default_data.set_sides(default_sides)
	set_data(default_data)


func shift(amount : int) -> void:
	_data.shift(amount)
	
	component_display.match_data(_data)


func set_board(board) -> void:
	_board = board
	emit_signal("board_changed", _board)


func get_board(): # -> CircuitBoard
	return _board


func set_data(data) -> void:
	_data = data
	emit_signal("data_changed", _data)
	
	_data.connect("grid_position_changed", self, "_on_change_position")
	
	component_display.match_data(_data)


func get_data(): # -> ComponentData
	return _data


func _on_change_position(new_position : Vector2) -> void:
	position = new_position * COMPONENT_SIZE + COMPONENT_SIZE / 2.0
