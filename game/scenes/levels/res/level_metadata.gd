extends Resource
class_name LevelMetadata

enum TIME {
    NONE,
    DAYTIME,
    NIGHTTIME,
}

enum WEATHER {
    NONE,
    CLEAR,
    RAIN,
    THUNDER,
    FOG,
}

@export_file("*.tscn") var path: String
@export var level_name := "Level"
@export var time: TIME
@export var weather: WEATHER


func _init(p_path := "", p_level_name := "", p_time := TIME.NONE, p_weather := WEATHER.NONE) -> void:
    path = p_path
    level_name = p_level_name
    time = p_time
    weather = p_weather
