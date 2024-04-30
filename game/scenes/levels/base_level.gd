extends Node3D
class_name BaseLevel

@export var level_metadata: LevelMetadata

@onready var _env := $env as WorldEnvironment


func quit_to_menu() -> void:
    LevelLoader.quit_to_menu()


func _ready() -> void:
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
    ($%location as Label).text = level_metadata.level_name
    ($%weather as Label).text = LevelLoader.enum_to_cap_string(
        LevelMetadata.WEATHER, level_metadata.weather)
    ($%time as Label).text = LevelLoader.enum_to_cap_string(
        LevelMetadata.TIME, level_metadata.time)

    _setup_metadata(level_metadata)


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_cancel"):
        get_tree().quit()
        #quit_to_menu()


func _setup_metadata(metadata: LevelMetadata) -> void:
    var env := _env.environment

    match metadata.weather:
        LevelMetadata.WEATHER.NONE,\
        LevelMetadata.WEATHER.CLEAR:
            env.background_energy_multiplier = 1
            env.ambient_light_color = Color.WHITE
            env.ambient_light_energy = 0.64
        LevelMetadata.WEATHER.RAIN:
            env.background_energy_multiplier = 0.4
            env.ambient_light_color = Color.BLACK
            env.ambient_light_energy = 0.64
        LevelMetadata.WEATHER.THUNDER:
            env.background_energy_multiplier = 0.2
            env.ambient_light_color = Color.BLACK
            env.ambient_light_energy = 0.64
        LevelMetadata.WEATHER.FOG:
            pass
        _:
            pass

    match metadata.time:
        LevelMetadata.TIME.NONE:
            pass
        LevelMetadata.TIME.DAYTIME:
            pass
        LevelMetadata.TIME.NIGHTTIME:
            pass
        _:
            pass
