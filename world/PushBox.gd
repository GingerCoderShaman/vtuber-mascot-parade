extends Area2D

enum DIRECTION {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

@export
var direction = DIRECTION.UP

var bodies = []

func _ready() -> void:
	self.connect('body_entered', _on_body_entered)

func process_interaction_with_body(body):
	var direction_to = Vector2(cos(body.angle), sin(body.angle))
	match direction:
		DIRECTION.UP:
			direction_to.y = -abs(direction_to.y) - .02
		DIRECTION.DOWN:
			direction_to.y = abs(direction_to.y) + .02
		DIRECTION.RIGHT:
			direction_to.x = abs(direction_to.x) + .02
		DIRECTION.LEFT:
			direction_to.x = -abs(direction_to.x) - .02
	body.angle = atan2(direction_to.y, direction_to.x)
	
func _process(_delta: float) -> void:
	process_bounds()

func process_bounds():
	var removes = []
	for body in bodies:
		if is_instance_valid(body) && overlaps_body(body): 
			process_interaction_with_body(body)
		else:
			removes.append(body)
	for remove in removes:
		bodies.erase(remove)

func _on_body_entered(body: Node2D) -> void:
	bodies.append(body)
