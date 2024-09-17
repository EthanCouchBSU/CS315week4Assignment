extends RigidBody2D

@export var _animated_sprite :AnimatedSprite2D
var current_animation
var reset_state = false
var moveVector: Vector2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_force(Vector2(0,1))
	pass # Replace with function body.
	
func _integrate_forces(state):
	
	if reset_state:
		state.transform = Transform2D(0.0, moveVector)
		reset_state= false
		
	

func move_body(targetPos: Vector2):
	moveVector = targetPos
	reset_state = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_pressed("flap"):
		apply_force(Vector2(0,-6000))
		current_animation = "flap"
		_animated_sprite.play("flap")
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	
	if current_animation == "flap":
		_animated_sprite.play(("glide"))
		current_animation = "glide"
	pass # Replace with function body.
