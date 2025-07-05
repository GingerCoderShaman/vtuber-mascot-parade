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

func _process(_delta: float) -> void:
	var removes = []
	for body in bodies:
		if overlaps_body(body):
			var snake_part = body.get_parent()
			var direction_to = Vector2(cos(snake_part.angle), sin(snake_part.angle))
			match direction:
				DIRECTION.UP:
					direction_to.y = -abs(direction_to.y) - .02
				DIRECTION.DOWN:
					direction_to.y = abs(direction_to.y) + .02
				DIRECTION.RIGHT:
					direction_to.x = abs(direction_to.x) + .02
				DIRECTION.LEFT:
					direction_to.x = -abs(direction_to.x) - .02
			snake_part.angle = atan2(direction_to.y, direction_to.x)
		else:
			removes.append(body)
	for remove in removes:
		bodies.erase(remove)

func _on_body_entered(body: Node2D) -> void:
	bodies.append(body)
