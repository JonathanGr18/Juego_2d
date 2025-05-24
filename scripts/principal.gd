extends Node2D
# Script de la escena principal. Controla la lógica general del juego.

# Precarga la escena del tamal (objeto coleccionable)
var tamal_escena = preload("res://escenas/Tamal.tscn")

# Contador de tamales recolectados
var tamales = 0

# Precarga la escena del enemigo alebrije
var enemigo_escena = preload("res://escenas/enemigo_alebrije.tscn")

# Función que instancia un enemigo y lo coloca en pantalla
func generar_enemigo():
	var enemigo = enemigo_escena.instantiate()
	add_child(enemigo)
	
	# Posición fija donde aparecerá el enemigo (puede cambiarse o randomizarse)
	enemigo.position = Vector2(800, 600)

# Función que suma un tamal al contador
func sumar_tamal():
	tamales += 1
	print("Tamales recolectados: ", tamales)

	# Actualiza el texto del contador en pantalla
	$Controles/ContadorTamal.text = "Tamales: " + str(tamales)

# Función que instancia un tamal en una posición aleatoria
func generar_tamal():
	var nuevo_tamal = tamal_escena.instantiate()
	add_child(nuevo_tamal)

	# Posición aleatoria dentro del área de juego
	var x = randi() % 500 + 100
	var y = randi() % 800 + 100
	nuevo_tamal.position = Vector2(x, y)

# Función que se ejecuta al iniciar la escena
func _ready():
	# Instancia un enemigo al comienzo
	generar_enemigo()
	
	# Inicializa el generador de números aleatorios
	randomize()
	
	# Genera 5 tamales en posiciones aleatorias
	for i in range(5):
		generar_tamal()
