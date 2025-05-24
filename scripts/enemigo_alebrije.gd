extends CharacterBody2D
# Este script controla el comportamiento del enemigo alebrije

# Velocidad de movimiento del enemigo
var velocidad = 100

# Variable que almacena una referencia al jugador
var objetivo = null  # Se asigna en _ready()

func _ready():
	# Al iniciar, busca al nodo del jugador dentro de la escena principal
	# Asegúrate de que el nodo jugador esté exactamente en "Principal/Jugador"
	objetivo = get_tree().get_root().get_node("Principal/Jugador")

func _physics_process(_delta):
	# Si el jugador fue encontrado
	if objetivo:
		# Calcula la dirección desde el enemigo hacia el jugador
		var direccion = (objetivo.global_position - global_position).normalized()
		
		# Establece la velocidad en esa dirección
		velocity = direccion * velocidad
		
		# Mueve al enemigo en esa dirección
		move_and_slide()

func _on_colision_body_entered(body: Node2D) -> void:
	# Si el enemigo colisiona con el jugador
	if body.name == "Jugador":
		# Muestra mensaje en consola
		print("¡Perdiste!")
		
		# Cambia la escena de nuevo al menú principal
		get_tree().change_scene_to_file("res://escenas/Menu.tscn")

