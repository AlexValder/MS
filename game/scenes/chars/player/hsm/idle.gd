extends "./player_state.gd"


func _update(_delta: float) -> void:
    var movement := Input.get_vector(&"left", &"right", &"backwards", &"forward")
    if not is_zero_approx(movement.length()):
        get_root().dispatch(&"walk")
