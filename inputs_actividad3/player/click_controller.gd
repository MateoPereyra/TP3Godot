extends Node

var motion
var player
var target

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	motion = Vector2.ZERO
	player = get_parent()
	target = player.global_position

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		target = player.get_global_mouse_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if player.global_position.distance_to(target) > 10:
		motion = player.global_position.direction_to(target)
	else:
		motion = Vector2.ZERO
