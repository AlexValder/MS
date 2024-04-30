extends "./moving.gd"


func _update(delta: float) -> void:
    super._update(delta)

    animation_player.speed_scale = _dir.length()

    if is_zero_approx(_dir.length()):
        get_root().dispatch(&"idle")
    elif Input.is_action_just_pressed(&"run"):
        get_root().dispatch(&"run")


func _exit() -> void:
    animation_player.speed_scale = 1
