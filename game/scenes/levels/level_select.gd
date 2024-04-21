extends Node
class_name LevelSelect

@export var table: Array[LevelMetadata]

@onready var _grid := $%levels as Container
@onready var _level_name := $%level_name as Label
@onready var _time := $%time as Label
@onready var _weather := $%weather as Label

var _current_index := -1


func get_level_metadata(index: int) -> LevelMetadata:
    if index >= table.size():
        push_error("No level #%d" % index)
        return null
    return table[index]


func load_level(index: int) -> void:
    var metadata := get_level_metadata(index)
    if metadata == null:
        return

    print("Choosing level %d" % index)
    LevelLoader.load_level(metadata)


func _ready() -> void:
    var children := _grid.get_children()
    var i := 0
    for child in children:
        var button := child as Button
        if button == null:
            continue
        button.text = "Level %d" % i
        button.button_up.connect(_on_level_button_up.bind(i))
        i += 1


func _on_exit_button_up() -> void:
    get_tree().quit()


func _on_level_button_up(index: int) -> void:
    _current_index = index
    $%play.disabled = false

    var metadata := get_level_metadata(index)
    if metadata == null:
        return

    _level_name.text = metadata.level_name
    _time.text = LevelLoader.enum_to_cap_string(LevelMetadata.TIME, metadata.time)
    _weather.text = LevelLoader.enum_to_cap_string(LevelMetadata.WEATHER, metadata.weather)


func _on_play_button_up() -> void:
    load_level(_current_index)
