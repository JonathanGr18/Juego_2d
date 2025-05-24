extends Node2D

var tamal_escena = preload("res://escenas/Tamal.tscn")
var tamales = 0

var enemigo_escena = preload("res://escenas/enemigo_alebrije.tscn")

func generar_enemigo():
	var enemigo = enemigo_escena.instantiate()
	add_child(enemigo)
	
	# Posición donde quieres que aparezca
	enemigo.position = Vector2(800, 600)  # Cambia según tu diseño

func sumar_tamal():
	tamales += 1
	print("Tamales recolectados: ", tamales)
	$Controles/ContadorTamal.text = "Tamales: " + str(tamales)

func generar_tamal():
	var nuevo_tamal = tamal_escena.instantiate()
	add_child(nuevo_tamal)

	# Posición aleatoria en pantalla (ajusta según tu juego)
	var x = randi() % 500 + 100
	var y = randi() % 800 + 100
	nuevo_tamal.position = Vector2(x, y)

func _ready():
	generar_enemigo()
	randomize()
	for i in range(5):
		generar_tamal()
