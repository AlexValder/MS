extends "res://scenes/chars/player/hsm/player_state.gd"


func _update(_delta: float) -> void:
    if !agent.is_on_floor():
        get_root().dispatch(&"fall")

    var movement := Input.get_vector(&"left", &"right", &"backwards", &"forward")
    if not is_zero_approx(movement.length()):
        get_root().dispatch(&"walk")
