class_name Component
extends Node2D


const COMPONENT_SIZE := Vector2(64, 64)

var _data setget set_data, get_data #: ComponentData

signal data_changed(new_data)


func set_data(data) -> void:
	_data = data
	emit_signal("data_changed", _data)
	
	_data.connect("grid_position_changed", self, "_on_change_position")


func get_data(): # -> ComponentData
	return _data


func _on_change_position(new_position : Vector2) -> void:
	position = new_position * COMPONENT_SIZE + COMPONENT_SIZE / 2.0
