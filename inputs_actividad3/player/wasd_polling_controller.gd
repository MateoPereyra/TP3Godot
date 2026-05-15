extends Node

var motion

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	motion = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	motion = Input.get_vector("move_left", "move_right", "move_up","move_bottom")
