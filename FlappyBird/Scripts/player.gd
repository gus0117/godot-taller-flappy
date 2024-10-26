extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -200.0

var isCollisionPipe : bool = false

# REFERENCIAS DE ESCENA
@onready var sfx_golpe: AudioStreamPlayer2D = $SFXGolpe
@onready var sfx_caida: AudioStreamPlayer2D = $SFXCaida

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		get_tree().quit()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") && !isCollisionPipe:
		velocity.y = JUMP_VELOCITY
		$SFXSalto.play()
	move_and_slide()

func recibirGolpe() -> void:
	isCollisionPipe = true
	reproducirSonidoGolpe()
	reproducirSonidoCaida()

func reproducirSonidoGolpe() -> void:
	sfx_golpe.play()

func reproducirSonidoCaida() -> void:
	sfx_caida.play()
