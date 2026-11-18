# Respuestas del Reto 1

## Pregunta 1
Mantén D dos segundos y suéltala:
¿Qué contador subió más y por qué?

Respuesta:
El contador de cuadros subió más porque
_physics_process se ejecuta continuamente
mientras la tecla está presionada.

En cambio, el contador de eventos aumenta
cuando se presiona y cuando se suelta D,
normalmente 2 eventos.

## Pregunta 2
Mantén A:
¿Qué valor muestran get_axis y
get_action_strength("move_right")?

Respuesta:
get_axis muestra -1.00 porque estamos
presionando la dirección izquierda.

get_action_strength("move_right") muestra
0.00 porque la tecla derecha no está pulsada.

La diferencia es que get_axis considera
ambas direcciones, mientras que
get_action_strength consulta una sola acción.

## Pregunta 3
Gira la rueda del ratón:
¿Qué clase aparece y por qué se comprueba
la rueda antes que el clic?

Respuesta:
Aparece InputEventMouseButton.

Esto sucede porque Godot utiliza esa clase
tanto para los clics como para la rueda.

Por eso comprobamos primero si el botón
corresponde a la rueda, para distinguirlo
de un clic normal.
