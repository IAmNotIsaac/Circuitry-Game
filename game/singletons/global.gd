extends Node


var instances := {
	"CIRCUIT_PIECE" : preload("res://scenes/2d/CircuitPiece.tscn")
}


func register_instance(identifier : String, scene : PackedScene) -> void:
	instances[identifier] = scene
