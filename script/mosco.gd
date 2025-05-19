extends Area2D

var velocidad = 40  # se puede ajustar según sea necesario
var direccion = Vector2.ZERO
var limites = Rect2(Vector2(20, 20), Vector2(440, 660))  # Tamaño ajustado para los límites

@onready var mosquito = $mosquito  # Para establecer la animacion

func _ready() -> void:
	randomize() # Se establece una direccion aleatoria
	direccion = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized()

func _process(delta: float) -> void:
	position += direccion * velocidad * delta # Mueve el mosquito teniendo en cuenta el limite y la animación
	verificar_bordes()
	actualizar_animacion()

func  verificar_bordes(): #valida que el mosco se encuentre dentro del limite
	if position.x < limites.position.x or position.x > limites.position.x + limites.size.x:
		direccion.x *= -1
	if position.y < limites.position.y or position.y > limites.position.y + limites.size.y:
		direccion.y *= -1

func actualizar_animacion():# Cambia la animacion segun la direccion
	if abs(direccion.x) > abs(direccion.y):
		if direccion.x > 0:
			mosquito.play("moscoRight")
		else:
			mosquito.play("moscoLeft")
	else:
		if direccion.y > 0:
			mosquito.play("moscoDown")
		else:
			mosquito.play("moscoUp")
