extends Area2D

const ACCELERATION = 2500
const MAX_SPEED = 500
const RANGE = 0

var velocity = Vector2.ZERO
var objective = Vector2.ZERO

func _ready():
	rotation += objective.angle()
	
func _process(delta):
	move(delta)

func move(delta):
	velocity = velocity.move_toward(objective * MAX_SPEED, ACCELERATION * delta)
	translate(velocity * delta)
