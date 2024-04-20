extends Resource
class_name LevelMetadata

enum TIME {
    DAYTIME,
    NIGHTTIME,
}

enum WEATHER {
    CLEAR,
    RAIN,
    THUNDER,
    FOG,
}

@export var level_name := "Level"
@export var time: TIME
@export var weather: WEATHER
@export_file("*.tscn") var path: String
