extends Node2D

@export var velocidad: float = 300.0

func _process(delta: float) -> void:
	var direccion = Input.get_axis("move_left", "move_right")

	position.x += direccion * velocidad * delta
