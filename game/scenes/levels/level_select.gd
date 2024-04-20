extends Node
class_name LevelSelect

@export var table: Array[LevelMetadata]

@onready var _grid := $%levels as Container


func load_level(index: int) -> void:
    if index >= table.size():
        push_error("No level #%d" % index)
        return

    print("Choosing level %d" % index)
    get_tree().change_scene_to_file(table[index].path)


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
    pass # Replace with function body.
