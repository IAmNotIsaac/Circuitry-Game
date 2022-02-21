extends Node


var instances := {
	"COMPONENT" : preload("res://scenes/2d/Component.tscn"),
	"SIGNAL" : preload("res://scenes/2d/CircuitSignal.tscn")
}


func register_instance(identifier : String, scene : PackedScene) -> void:
	instances[identifier] = scene
