extends CharacterBody2D

@onready var player_id = 0
const SPEED = 500.0
@onready var magic_arrow = preload("uid://da0dlhxi7gexs")
@onready var hp_bar: LineEdit = $Control/LineEdit
@export var hp : float = 100


func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

func _physics_process(delta: float) -> void:
	if !is_multiplayer_authority() : return
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down")*SPEED
	move_and_slide()
	hp_bar.text = str(hp)



func _on_timer_timeout() -> void:
	var new_magic = magic_arrow.instantiate()
	new_magic.position = position
	new_magic.player_id = player_id
	get_tree().root.get_children()[0].add_child(new_magic)


func _on_area_2d_being_hit_by_attack(dmg) -> void:
	hp -= dmg
	print("im being hti")
