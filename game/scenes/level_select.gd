extends Node

@onready var _grid := $%levels as Container


func load_level(index: int) -> void:
    GameManager.load_level(index)


func _add_button(parent: Node, index: int) -> void:
    var button := Button.new()
    button.text = "Level %d" % index
    button.button_up.connect(load_level.bind(index))
    button.disabled = true
    parent.add_child(button)


func _ready() -> void:
    for i in 9:
        _add_button(_grid, i + 1)
    var button := _grid.get_child(0) as Button
    button.disabled = false


func _on_exit_button_up() -> void:
    get_tree().quit()
