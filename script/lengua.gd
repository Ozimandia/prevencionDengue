extends Area2D

@onready var lengua = $SpriteLengua
@onready var colision = $CollisionLengua
signal mosquito_atrapado(mosco)

func estirar_mover(destino: Vector2):
	#variables para definir la direccion, distancia y angulo que debe estirar la lengua
	var origen = global_position
	var direccion = destino - origen
	var distancia = direccion.length()
	var angulo = direccion.angle()
	var desplazamiento = Vector2(distancia, 0)  # local antes de rotar el nodo
	
	rotation = angulo #rotacion de la lengua
	#que tanto se estira la lengua en los ejes Y y X
	lengua.scale.x = distancia/ float(lengua.texture.get_width())#permite llegar al mouse
	lengua.scale.y = 0.5 #establece el ancho de la imagen
	colision.position = desplazamiento.rotated(0)#deplazamiento de la colision
	
	visible = true
	monitoring = true
	await get_tree().create_timer(0.3).timeout
	
	visible = false
	monitoring = false
	scale.x = 1
	colision.position = Vector2.ZERO

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("moscos"):
		emit_signal("mosquito_atrapado", area)
