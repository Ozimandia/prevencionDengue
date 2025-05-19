extends Control

func Mostrar_pantalla_final(gano: bool):
	if gano == true:
		$ganar.visible = true
	else:
		$perder.visible = true


func _on_button_reiniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://inicio_ui.tscn")


func _on_button_salir_pressed() -> void:
	get_tree().quit()
