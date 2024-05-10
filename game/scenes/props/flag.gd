extends Node3D
class_name FlagPole

@export var color1 := Color8(91, 206, 250)
@export var color2 := Color8(245, 169, 184)
@export var color3 := Color8(255, 255, 255)
@export var color4 := Color8(245, 169, 184)
@export var color5 := Color8(91, 206, 250)

@export_node_path("GeometryInstance3D") var _mesh_path: NodePath


func _ready() -> void:
    var _flag := get_node(_mesh_path) as GeometryInstance3D
    _flag.set_instance_shader_parameter(&"color1", color1)
    _flag.set_instance_shader_parameter(&"color2", color2)
    _flag.set_instance_shader_parameter(&"color3", color3)
    _flag.set_instance_shader_parameter(&"color4", color4)
    _flag.set_instance_shader_parameter(&"color5", color5)

