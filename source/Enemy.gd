extends "res://source/Actor.gd"
#
#
#func _ready() -> void:
#	set_physics_process(false)
#	_velocity.x = -speed.x


func _on_StompDetector_body_entered(body) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	#get_node("CollisionShape2D").disabled = true
	queue_free()


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	_velocity.x = speed.x * _get_direction_enemy(get_node("/root/Node2D/Player").position, get_position())
	_velocity.y = move_and_slide(_velocity,
	FLOOR_NORMAL).y

func _get_direction_enemy (pos_player: Vector2, pos_enemy: Vector2) -> float:
	if  pos_player.x > pos_enemy.x:
		return 1.0
	else:
		return -1.0
