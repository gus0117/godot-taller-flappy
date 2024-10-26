extends Node2D

@export var speed : float = 100
@export var bottomLimit: int = 0
@export var topLimit: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.y = randi_range(topLimit, bottomLimit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta


func _on_detector_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player":
		GLOBAL.score += 1

func on_lose_player(body: Node2D) -> void:
	if body is Player:
		body.recibirGolpe()

func _on_pipe_top_body_entered(body: Node2D) -> void:
	on_lose_player(body)

func _on_pipe_bottom_body_entered(body: Node2D) -> void:
	on_lose_player(body)
