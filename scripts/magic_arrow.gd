extends CharacterBody2D

@export var dmg : int = 10
@onready var player_id = 0
const SPEED = 500.0
@onready var active : bool = true


func _physics_process(delta: float) -> void:
	
	velocity = Vector2(100.0,0.0)
	move_and_slide()

func person_hit(body: Node2D) -> void:
	print("arrow hit")
	if active == true:
		if !body.root_node.player_id == player_id:
			body.being_hit_by_attack.emit(dmg)
			print("others being hit")
			active = false
		else:
			pass
	else:
		queue_free()
