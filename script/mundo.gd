extends Node2D

var tiempo_total = 30  # segundos
var tiempo_restante = tiempo_total
var atrapados = 0
var cantidad_moscos = 0
var mosco_scena = preload("res://mosco.tscn")

func _ready():
	$HUD.actualizar_tiempo(tiempo_restante)
	$HUD.actualizar_atrapados(atrapados)
	$Personaje/Lengua.connect("mosquito_atrapado", Callable(self, "_on_mosquito_atrapado"))
	$TimerJuego.start()

func _on_timer_juego_timeout() -> void:
	tiempo_restante -= 1
	$HUD.actualizar_tiempo(tiempo_restante)
	if tiempo_restante <= 0:
		finalizar_juego()

func _on_timer_spawn_timeout() -> void:
	for i in range(5):
		var mosco = mosco_scena.instantiate()
		var x = randi_range(20, 460)
		var y = randi_range(20, 680)
		mosco.position = Vector2(x,y)
		$ContenedorMoscos.add_child(mosco)
		mosco.add_to_group("moscos")
		cantidad_moscos += 1

func _on_mosquito_atrapado(mosquito):
	mosquito.queue_free()
	atrapados += 1
	$HUD.actualizar_atrapados(atrapados)

func finalizar_juego():
	var porcentaje = float(atrapados) / cantidad_moscos
	$TimerJuego.stop()
	$TimerSpawn.stop()
	$PantallaFinal.visible = true
	$PantallaFinal.Mostrar_pantalla_final(porcentaje >=0.6)
