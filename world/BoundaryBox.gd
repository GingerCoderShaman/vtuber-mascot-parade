extends Area2D

var bodies = []

func _ready() -> void:
	self.connect('body_entered', _on_body_entered)

func _process(_delta: float) -> void:
	var removes = []
	for body in bodies:
		if overlaps_body(body):
			var snake_part = body.get_parent()
			var direction_to = Vector2(cos(snake_part.angle), sin(snake_part.angle))
			var position = snake_part.position
			
			
			snake_part.angle = atan2(direction_to.y, direction_to.x)
		else:
			removes.append(body)
	for remove in removes:
		bodies.erase(remove)

func _on_body_entered(body: Node2D) -> void:
	bodies.append(body)
