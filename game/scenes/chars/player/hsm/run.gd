extends "./moving.gd"


func _update(delta: float) -> void:
    super._update(delta)

    if is_zero_approx(_dir.length()):
        get_root().dispatch(&"idle")
    elif Input.is_action_just_released(&"run"):
        get_root().dispatch(&"walk")
