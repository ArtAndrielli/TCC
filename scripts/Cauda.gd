extends Marker2D

@onready var cauda: Marker2D = $"."
@onready var personagem: CharacterBody2D = $"../.."
@onready var ray_cast: RayCast2D = $"../../RayCastCauda"
@onready var ray_cast_2: RayCast2D = $"../../RayCast2D"
 
var caudaSenX 
var caudaY 
var chao = 203
var x = 0
var increment = 0.1
var setColli = false
var setColli2 = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	caudaSenX = sin(x)
	caudaY = chao

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#incrementador
	cauda.position.x = caudaSenX
	x = x + increment
	ray_cast.position.x = cauda.position.x
	ray_cast_2.position.y = cauda.position.y - 10
	ray_cast_2.position.x = cauda.position.x
	if ray_cast.is_colliding():
		caudaSenX = 100 * sin(x/4)
		if !setColli:
			caudaY = ray_cast.global_position.y + 125
			setColli = true
		cauda.global_position.y = caudaY

	if !ray_cast.is_colliding():
		caudaSenX = 100 * sin(x/4)
		if cauda.position.y < chao:
			cauda.position.y += increment*20
		ray_cast_2.target_position.y =  personagem.global_position.x - cauda.global_position.x 
		setColli = false

	if ray_cast_2.is_colliding():
		increment = 0

	if !ray_cast_2.is_colliding():
		increment = 0.1
		
