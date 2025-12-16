extends CharacterBody2D

const SPEED = 500.0
@onready var magic_arrow = preload("uid://da0dlhxi7gexs")

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

func _physics_process(delta: float) -> void:
	if !is_multiplayer_authority() : return
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down")*SPEED
	move_and_slide()
	



func _on_timer_timeout() -> void:
	var new_magic = magic_arrow.instantiate()
	new_magic.position = position
	get_tree().root.get_children()[0].add_child(new_magic)


func _on_area_2d_being_hit_by_attack() -> void:
	print("im being hti")
