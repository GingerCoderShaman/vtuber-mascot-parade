extends Area2D

var bodies = []

func _ready() -> void:
	self.connect('body_entered', _on_body_entered)

func _process(_delta: float) -> void:
	var removes = []
	for body in bodies:
		if is_instance_valid(body) && overlaps_body(body): 
			var snake_part = body.get_controller()
			for child in get_children():
				if child is CollisionShape2D:
					if child.shape is RectangleShape2D:
						if child.shape.collide(child.transform, child.shape, snake_part.transform):
							var position_local = child.to_local(snake_part.position)
							var angle_transform = child.transform
							angle_transform.origin = Vector2.ZERO
							var angle_vectors = angle_transform.affine_inverse() * (Vector2(cos(snake_part.angle), sin(snake_part.angle)))
							var bounds = child.shape.size/2
							var diff = position_local
							if bounds.x-abs(diff.x) < bounds.y-abs(diff.y):
								if diff.x > 0:
									angle_vectors.x = abs(angle_vectors.x)
								else:
									angle_vectors.x = -abs(angle_vectors.x)
							else:
								if diff.y > 0:
									angle_vectors.y = abs(angle_vectors.y)
								else:
									angle_vectors.y = -abs(angle_vectors.y)
							angle_vectors = angle_transform * (angle_vectors)
							snake_part.angle = atan2(angle_vectors.y, angle_vectors.x)
					else:
						print("Child shape not supported in process")
				elif child is CollisionObject2D:
					print("Child object not supported in process")
		else:
			removes.append(body)
	for remove in removes:
		bodies.erase(remove)

func _on_body_entered(body: Node2D) -> void:
	bodies.append(body)
