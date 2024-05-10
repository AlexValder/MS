extends LimboHSM

@export var player: Player
@export var label: Label


func setup_state_machine() -> void:
    add_transition($idle, $walk, &"walk")
    add_transition($idle, $run, &"run")
    add_transition($idle, $fall, &"fall")

    add_transition($run, $idle, &"idle")
    add_transition($run, $walk, &"walk")
    add_transition($run, $fall, &"fall")

    add_transition($walk, $run, &"run")
    add_transition($walk, $idle, &"idle")
    add_transition($walk, $fall, &"fall")

    add_transition($fall, $idle, $fall.EVENT_FINISHED)

    initialize(player)
    set_active(true)


func _on_active_state_changed(current: LimboState, previous: LimboState) -> void:
    #if previous:
        #print("%s => %s" % [previous.name, current.name])
    #else:
        #print(current.name)
    if label:
        label.text = current.name
