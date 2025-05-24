extends CharacterBody2D

var velocidad = 200
var direccion = Vector2.ZERO

func _physics_process(_delta):
	direccion = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direccion.x += 1
	if Input.is_action_pressed("ui_left"):
		direccion.x -= 1
	if Input.is_action_pressed("ui_down"):
		direccion.y += 1
	if Input.is_action_pressed("ui_up"):
		direccion.y -= 1

	direccion = direccion.normalized()
	velocity = direccion * velocidad
	move_and_slide()
