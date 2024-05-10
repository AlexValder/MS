extends Node

enum DEATH_REASON {
    SHOT,
    GRAVITY,
    OUT_OF_BOUNDS,
    DROWN,
}

const DEATH_REASON_STRINGS := {
    DEATH_REASON.SHOT: "%s was shot",
    DEATH_REASON.GRAVITY: "%s fell from too high",
    DEATH_REASON.OUT_OF_BOUNDS: "%s left the material plane of reality",
    DEATH_REASON.DROWN: "%s drown",
}


func on_player_death(reason: DEATH_REASON) -> void:
    print(DEATH_REASON_STRINGS[reason] % "You")
    get_tree().reload_current_scene()
