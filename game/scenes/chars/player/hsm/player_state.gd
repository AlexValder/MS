extends LimboState

@export var animation_player: AnimationPlayer
@export var animation: StringName
@export_range(0, 10.0) var animation_blend_time := 0.25
@export var animation_speed := 1.0


func get_gravity() -> Vector3:
    var gravity := ProjectSettings.get_setting(&"physics/3d/default_gravity") as float
    var vector := ProjectSettings.get_setting(&"physics/3d/default_gravity_vector") as Vector3

    return vector * gravity


func _enter() -> void:
    animation_player.play(animation, animation_blend_time, animation_speed)
