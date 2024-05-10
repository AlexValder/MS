extends "res://scenes/chars/player/hsm/player_state.gd"


func _enter() -> void:
    # TODO: add falling animation
    pass


func _update(_delta: float) -> void:
    agent.velocity = get_gravity()
    agent.move_and_slide()

    if agent.is_on_floor():
        get_root().dispatch(EVENT_FINISHED)
