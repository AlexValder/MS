extends LimboHSM

@export var player: Player


func setup_state_machine() -> void:
    add_transition($idle, $run, $idle.EVENT_FINISHED)
    add_transition($run, $idle, $run.EVENT_FINISHED)

    initialize(player)
    set_active(true)
