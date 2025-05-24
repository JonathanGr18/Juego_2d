extends Control
# Script del menú principal. Controla la navegación hacia el juego.

# Función que se ejecuta cuando se presiona el botón "Jugar"
func _on_button_pressed():
	# Cambia la escena actual por la escena principal del juego
	var resultado = get_tree().change_scene_to_file("res://escenas/Principal.tscn")
