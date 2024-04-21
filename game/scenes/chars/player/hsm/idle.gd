extends LimboState

@export var animation_player: AnimationPlayer
@export var idle_animation: StringName


func _enter() -> void:
    animation_player.play(idle_animation, 0.1)
    agent.camera_standalone = true


func _update(_delta: float) -> void:
    var movement := Input.get_vector(&"left", &"right", &"backwards", &"forward")
    if not is_zero_approx(movement.length()):
        get_root().dispatch(EVENT_FINISHED)
