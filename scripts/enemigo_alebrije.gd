extends CharacterBody2D

var velocidad = 100
var objetivo = null  # Referencia al jugador

func _ready():
	# Busca automáticamente al jugador cuando el enemigo se crea
	objetivo = get_tree().get_root().get_node("Principal/Jugador")

func _physics_process(_delta):
	if objetivo:
		var direccion = (objetivo.global_position - global_position).normalized()
		velocity = direccion * velocidad
		move_and_slide()

func _on_colision_body_entered(body: Node2D) -> void:
	if body.name == "Jugador":
		print("¡Perdiste!")
		get_tree().change_scene_to_file("res://escenas/Menu.tscn")
