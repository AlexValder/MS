extends Node


func load_level(metadata: LevelMetadata) -> void:
    assert(metadata.path.is_absolute_path())
    var pck := load(metadata.path) as PackedScene
    var new_level := pck.instantiate()
    if new_level is BaseLevel:
        _set_up_playable_level(new_level, metadata)
        Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
    else:
        Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

    var root := get_tree().root
    var curr_scene := get_tree().current_scene
    root.remove_child(curr_scene)
    curr_scene.queue_free()
    root.add_child(new_level)
    get_tree().current_scene = new_level


func quit_to_menu() -> void:
    load_level(LevelMetadata.new("res://scenes/levels/level_select.tscn"))


@warning_ignore("untyped_declaration")
func enum_to_cap_string(type, value) -> String:
    return str(type.keys()[value]).capitalize()


func _set_up_playable_level(level: BaseLevel, metadata: LevelMetadata) -> void:
    level.level_metadata = metadata
