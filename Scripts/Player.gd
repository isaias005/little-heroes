extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 500

var velocity = Vector2.ZERO
var Proyectile = preload("res://Scenes/Proyectile.tscn")

func _physics_process(delta):
	shoot()
	move(delta)

func move(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)

func shoot():
	if Input.is_action_just_pressed("shoot"):
		var proyectile = Proyectile.instance()
		proyectile.get_node("Sprite").texture = load("res://Sprites/KnightProyectile.png")
		proyectile.position = position
		proyectile.z_index -=1
		proyectile.objective = get_local_mouse_position()
		get_parent().add_child(proyectile)
