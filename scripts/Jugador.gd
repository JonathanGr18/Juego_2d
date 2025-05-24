extends CharacterBody2D
# Script del jugador para manejar movimiento con teclado o controles táctiles

# Velocidad de movimiento del jugador
var velocidad = 200

# Dirección en la que se moverá el jugador (se actualiza en cada frame)
var direccion = Vector2.ZERO

func _physics_process(_delta):
	# Reinicia la dirección cada frame
	direccion = Vector2.ZERO

	# Detecta si el jugador está presionando teclas de dirección (input map)
	if Input.is_action_pressed("ui_right"):
		direccion.x += 1
	if Input.is_action_pressed("ui_left"):
		direccion.x -= 1
	if Input.is_action_pressed("ui_down"):
		direccion.y += 1
	if Input.is_action_pressed("ui_up"):
		direccion.y -= 1

	# Normaliza el vector para evitar que se mueva más rápido en diagonal
	direccion = direccion.normalized()

	# Aplica la velocidad en la dirección deseada
	velocity = direccion * velocidad

	# Mueve al jugador con detección de colisiones
	move_and_slide()
