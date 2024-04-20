extends Node3D

@export var level_metadata: LevelMetadata


func quit_to_menu() -> void:
    get_tree().change_scene_to_file("res://scenes/levels/level_select.tscn")


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_cancel"):
        quit_to_menu()
