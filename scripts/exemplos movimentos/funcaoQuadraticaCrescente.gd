extends Node

@export var Marcador : Marker2D

var incrementador
var x 
var quadraticoCrescenteX 

func _ready() -> void:
	# Para usar o método de incrementação, lembrar de igualar a posição inicial do marcador
	# com a posição inicial da função no valor de x inicial.
	# Por exemplo a posição (0;0): iniciar com o valor de x = 0 pois, no gráfico de x^2,
	# o ponto retornado tambem é (0;0).
	incrementador = 0.1
	x = 0
	quadraticoCrescenteX  = sqrt(x)


func _process(delta: float) -> void:
	Marcador.position.y = quadraticoCrescenteX   # A posição do marcador no eixo Y é igual a variavel x^2.
	Marcador.postion.x = x      # A posição do marcador no eixo X é igual a variavel x.
	
	x =+ incrementador   # a cada frame o valor de x é incrementado pelo incrementador.
	quadraticoCrescenteX = sqrt(x)
