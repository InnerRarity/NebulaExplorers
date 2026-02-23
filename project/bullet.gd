extends Area2D


var speed : int = 1000
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * delta

func _on_area_entered(area: Area2D) -> void:
	print("Has tocado algo!")
	queue_free()
	area.position.x += 3
	area.rotation_degrees += randi_range(-10,10)
	
	if area.has_method("_receive_damage"):
		#area.health -= 3
		#if (area.health < 1):
			#area.queue_free()
		area._receive_damage()
