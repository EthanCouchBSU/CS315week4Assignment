extends Node2D
@export var rockResource = preload("res://rock.tscn")
@export var playerResource = preload("res://player.tscn")
@onready var game_Over = get_node("game_Over")
@onready var game_Over_Animation = get_node( "game_Over/AnimationPlayer")
@onready var game_hit_Noise = get_node( "sfx/hit_Sound")
@onready var game_rock_timer = get_node( "rock_timer")
var player = playerResource.instantiate()

func plane_hit():
	game_Over.visible = true
	game_Over_Animation.play("slide in")
	game_hit_Noise.play()
	game_rock_timer.stop()
	player.visible = false
	
	
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	player.move_body(Vector2(100,100))
	add_child(player)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_rock_timer_timeout() -> void:
	var rock = rockResource.instantiate()
	rock.position.x  = get_viewport().size.x -50
	if (randf() >.5):
		rock.position.y = 460
		add_child(rock)
	else:
		rock.position.y = 80
		rock.rotation = 3.1
		add_child(rock)
		
	
		
	pass # Replace with function body.


func _on_button_button_down() -> void:
	
	game_Over.visible = false
	
	player.move_body(Vector2(100,100))
	player.visible = true
	game_rock_timer.start()
	
	
	pass # Replace with function body.
