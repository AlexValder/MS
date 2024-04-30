extends LimboHSM

@export var player: Player


func setup_state_machine() -> void:
    add_transition($idle, $walk, &"walk")
    add_transition($idle, $run, &"run")

    add_transition($run, $idle, &"idle")
    add_transition($run, $walk, &"walk")

    add_transition($walk, $run, &"run")
    add_transition($walk, $idle, &"idle")

    initialize(player)
    set_active(true)
