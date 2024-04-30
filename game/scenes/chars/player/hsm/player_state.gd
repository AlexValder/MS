extends LimboState

@export var animation_player: AnimationPlayer
@export var animation: StringName
@export_range(0, 10.0) var animation_blend_time := 0.25
@export var animation_speed := 1.0


func _enter() -> void:
    animation_player.play(animation, animation_blend_time, animation_speed)
