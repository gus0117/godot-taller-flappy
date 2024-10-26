extends Node2D

@export var tubieriasRef: PackedScene

func _on_timer_timeout() -> void:
	var tuberiaInstancia = tubieriasRef.instantiate()
	tuberiaInstancia.position.x = 334;
	add_child(tuberiaInstancia)
