extends Area2D
signal hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 15
	pass



func _on_body_entered(body: Node2D) -> void:
	get_tree().root.get_child(0).plane_hit()
	pass # Replace with function body.
