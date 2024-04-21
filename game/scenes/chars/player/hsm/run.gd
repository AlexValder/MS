extends LimboState

@export var animation_player: AnimationPlayer
@export var animation: StringName
@export var speed: float = 500.0


func _enter() -> void:
    animation_player.play(animation, 0.1)
    agent.camera_standalone = false


func _update(delta: float) -> void:
    var movement := Input.get_vector(&"right", &"left", &"backwards", &"forward")

    var desired_velocity := movement * speed * delta
    agent.move(desired_velocity)

    if is_zero_approx(movement.length()):
        get_root().dispatch(EVENT_FINISHED)
