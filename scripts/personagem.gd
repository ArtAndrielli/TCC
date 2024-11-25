extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_legs: AnimationPlayer = $AnimationLegs
@onready var Tjump: Timer = $Timers/jump
@onready var marker_e: Marker2D = $Marcadores/MarkerE
@onready var marker_d: Marker2D = $Marcadores/MarkerD

const SPEED = 300.0
const JUMP_VELOCITY = -800.0

var STATE = false
var STATE_LEGS = true
var LegAtual = 'voo'
var repousado = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if STATE_LEGS == true:
			STATE_LEGS = false
			animation_legs.play('voo')
		
	if is_on_floor():
		if STATE_LEGS == false:
			STATE_LEGS = true
			animation_legs.play('chao')
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and STATE == false:
		STATE = true
		animation_player.play('voo')
		Tjump.start()
		
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_jump_timeout() -> void:
	velocity.y = JUMP_VELOCITY

func _on_animation_player_animation_finished(_voo) -> void:
	STATE = false

#func _on_animation_legs_animation_finished(LegAtual) -> void:

	
