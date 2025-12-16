extends CharacterBody2D

const SPEED = 500.0

func _physics_process(delta: float) -> void:
	
	velocity = Vector2(100.0,0.0)
	move_and_slide()

func person_hit(body: Node2D) -> void:
	body.being_hit_by_attack.emit()
