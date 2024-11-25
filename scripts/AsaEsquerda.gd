extends Marker2D

@onready var personagem: CharacterBody2D = $"../.."
@onready var marker_d: Marker2D = $"."

var repouso = false
var repousado = false
var a_x = 0.4
var a_y = 0.04
var PassX = false
var PassY = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if personagem.is_on_floor() == false:
		repousado = false
		PassX = false
		PassY = false
		repouso = false
		a_y = a_x/10

	if personagem.is_on_floor() and repousado == false:
		repouso = true

	if repouso == true:
		if marker_d.position.x >= -72 and !PassX:
			marker_d.move_local_x(-a_x)
			if marker_d.position.x < -72:
				PassX = true

		if marker_d.position.x < -70 and !PassX:
			marker_d.move_local_x(a_x)
			if marker_d.position.x >= -70:
				PassX = true

		if marker_d.position.y < 132 and !PassY:
			marker_d.move_local_y(a_y)
			if marker_d.position.y >= 132:
				PassY = true

		if marker_d.position.y >= 134 and !PassY:
			marker_d.move_local_y(-a_y)
			if marker_d.position.y < 134:
				PassY = true

		if PassX == true and PassY == true:
			PassX = false
			PassY = false
			repousado = true
			repouso = false
			a_y = a_x/10

		a_y = a_x/20 + a_y
