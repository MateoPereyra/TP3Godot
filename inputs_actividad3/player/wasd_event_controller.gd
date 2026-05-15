extends Node

var motion := Vector2.ZERO

var left := false
var right := false
var up := false
var down := false

func _input(event):

	if event.is_action_pressed("move_left"):
		left = true
	if event.is_action_released("move_left"):
		left = false

	if event.is_action_pressed("move_right"):
		right = true
	if event.is_action_released("move_right"):
		right = false

	if event.is_action_pressed("move_up"):
		up = true
	if event.is_action_released("move_up"):
		up = false

	if event.is_action_pressed("move_bottom"):
		down = true
	if event.is_action_released("move_bottom"):
		down = false

	motion = Vector2(int(right) - int(left), int(down) - int(up)).normalized() 
