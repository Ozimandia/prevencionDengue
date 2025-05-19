extends Area2D

@onready var lengua = $Lengua
@onready var rana = $Rana

func _ready() -> void:
	lengua.visible = false
	rana.play("CerrarBoca")

func _input(event):
	#segun la posicion al hacer clic llama la funcion atacar y se envia la posicion global del mouse
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var objetivo = get_global_mouse_position()
		_atacar(objetivo) 
	elif event is InputEventScreenTouch and event.pressed:
		_atacar(event.position)

func _atacar(posicion_objetivo: Vector2):
	
	rana.play("AbrirBoca") #animacion de la rana 
	lengua.estirar_mover(posicion_objetivo) #llama la funcion que hace el movimiento de la lengua
	await get_tree().create_timer(0.5).timeout#espera 5 ms 
	rana.play("CerrarBoca")#animacion de la rana
