class_name Component
extends Node2D


const COMPONENT_SIZE := Vector2(64, 64)

var _data setget set_data, get_data #: ComponentData
var _board setget set_board, get_board #: CircuitBoard

signal data_changed(new_data)
signal board_changed(new_board)


func set_board(board) -> void:
	_board = board
	emit_signal("board_changed", _board)


func get_board(): # -> CircuitBoard
	return _board


func set_data(data) -> void:
	_data = data
	emit_signal("data_changed", _data)
	
	_data.connect("grid_position_changed", self, "_on_change_position")


func get_data(): # -> ComponentData
	return _data


func _on_change_position(new_position : Vector2) -> void:
	position = new_position * COMPONENT_SIZE + COMPONENT_SIZE / 2.0
