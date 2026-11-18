extends Node2D

@onready var hud: Label = $Hud

var cuadros := 0
var eventos := 0

var clase := "Ninguno"
var dispositivo := "Ninguno"
var senal := "Ninguna"


func _physics_process(delta: float) -> void:
	# Contar cuadros mientras D esta pulsada
	if Input.is_action_pressed("move_right"):
		cuadros += 1

	# Obtener valores de entrada
	var salto = Input.is_action_pressed("jump")
	var eje = Input.get_axis("move_left", "move_right")
	var fuerza = Input.get_action_strength("move_right")

	# Mostrar informacion
	hud.text = "PANEL DE CONTROLES\n\n"
	hud.text += "Jump: " + str(salto) + "\n"
	hud.text += "Eje: %.2f\n" % eje
	hud.text += "Fuerza derecha: %.2f\n\n" % fuerza

	hud.text += "Ultimo evento: " + clase + "\n"
	hud.text += "Dispositivo: " + dispositivo + "\n"
	hud.text += "Tipo de señal: " + senal + "\n\n"

	hud.text += "Cuadros derecha: " + str(cuadros) + "\n"
	hud.text += "Eventos derecha: " + str(eventos)


func _input(event: InputEvent) -> void:
	# Ignorar repeticion automatica del teclado
	if event is InputEventKey and event.is_echo():
		return

	if event.is_action("move_right"):
		eventos += 1

	clase = event.get_class()
	dispositivo = str(event.device)

	if event is InputEventKey:
		dispositivo = "Teclado (ID " + str(event.device) + ")"
		senal = "Digital"

	elif event is InputEventMouseButton:
		dispositivo = "Raton (ID " + str(event.device) + ")"

		if event.button_index == MOUSE_BUTTON_WHEEL_UP or event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			senal = "Digital - rueda"
		else:
			senal = "Digital - clic"

	elif event is InputEventMouseMotion:
		dispositivo = "Raton (ID " + str(event.device) + ")"
		senal = "Posicion"

	else:
		senal = "Otra"
