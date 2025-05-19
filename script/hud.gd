extends CanvasLayer

@onready var tiempo_label = $LabelTiempoRestante
@onready var atrapados_label = $LabelMosquitosAtrapados

func actualizar_tiempo(segundos):
	tiempo_label.text = "Tiempo: %d s" % segundos

func actualizar_atrapados(cantidad):
	atrapados_label.text = "Atrapados: %d" % cantidad
