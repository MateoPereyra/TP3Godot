extends CharacterBody2D

@export var SPEED: float = 160
@export var MAX_HEALTH: float = 100

@onready var health = MAX_HEALTH

var dead = false

signal health_change
signal im_dead

##Para saber el script activo
var current_controller

func _ready():
	emit_signal("health_change",health)
	current_controller = $WASDPollingController
	current_controller.set_physics_process(true)


func _physics_process(delta):
	velocity = SPEED * current_controller.motion.normalized()
	move_and_collide(velocity * delta)

func hurt(amount):
	health = clamp(health-amount, 0 , 100)
	
	#esto podría ir en un setter
	if health <= 0:
		if !dead:
			emit_signal("im_dead")
			dead = true
			set_physics_process(false) 
		health = 0
		return
	
	emit_signal("health_change",health)


##Al entrar a un area hago nuevo controller = (el nuevo)
## currentcontroller.activo = false o algo asi
## currentcontroller = nuevo controller
## currentcontroller.activo = true

func set_new_controller(body: Node2D, ref: Node):
	if body == self && current_controller != ref:
		current_controller.set_physics_process(false)
		current_controller = ref
		current_controller.set_physics_process(true)
		print(ref)

func _on_wasd_event_area_body_entered(body: Node2D) -> void:
	set_new_controller(body, $WASDEventController)

func _on_click_area_body_entered(body: Node2D) -> void:
	set_new_controller(body, $ClickController)

func _on_mouse_area_body_entered(body: Node2D) -> void:
	set_new_controller(body, $MouseController)

func _on_wasd_poll_area_body_entered(body: Node2D) -> void:
	set_new_controller(body, $WASDPollingController)
