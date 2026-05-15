extends Node

var motion
var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	motion = Vector2.ZERO
	player = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var mouse_pos = player.get_global_mouse_position()
	var dir = mouse_pos - player.global_position
	
	##Para evitar vibracion al llegar al punto
	if dir.length() > 5:
		motion = dir.normalized()
	else:
		motion = Vector2.ZERO
