extends LimboHSM

@export var player: Player


func setup_state_machine() -> void:
    add_transition($idle, $run, $idle.EVENT_FINISHED)
    add_transition($run, $idle, $run.EVENT_FINISHED)

    #add_transition($idle, $jump, "jump")
    #add_transition($run, $jump, "jump")

    #add_transition($jump, $fall, $jump.EVENT_FINISHED)
    #add_transition($fall, $idle, $fall.EVENT_FINISHED)

    initialize(player)
    set_active(true)
