#include "level3d.hh"

#include <godot_cpp/core/class_db.hpp>
#include <stdio.h>

namespace godot::avalder
{
void Level3D::_bind_methods()
{
    ClassDB::bind_method(D_METHOD("get_level_name"), &Level3D::get_level_name);
    ClassDB::bind_method(D_METHOD("set_level_name", "p_name"), &Level3D::set_level_name);
    ClassDB::add_property("Level3D", PropertyInfo(Variant::STRING, "level_name"), "set_level_name", "get_level_name");

    ClassDB::bind_method(D_METHOD("get_geometry_path"), &Level3D::get_geometry_path);
    ClassDB::bind_method(D_METHOD("set_geometry_path", "node_path"), &Level3D::set_geometry_path);
    ClassDB::add_property("Level3D", PropertyInfo(Variant::NODE_PATH, "geometry_path"), "set_geometry_path",
                          "get_geometry_path");

    ClassDB::bind_method(D_METHOD("get_player_spawn_point"), &Level3D::get_player_spawn_point);
    ClassDB::bind_method(D_METHOD("set_player_spawn_point", "node_path"), &Level3D::set_player_spawn_point);
    ClassDB::add_property("Level3D", PropertyInfo(Variant::NODE_PATH, "player_spawn_point"), "set_player_spawn_point",
                          "get_player_spawn_point");
}

void Level3D::_ready()
{
    if (!this->get_level_name().is_empty())
    {
        printf("Level Name: %s\n", this->get_level_name().ptr());
    }
    else
    {
        printf("Level name not set\n");
    }
}

void Level3D::set_level_name(const String &p_name)
{
    this->level_name = p_name;
}

const String &Level3D::get_level_name() const
{
    return this->level_name;
}

void Level3D::set_geometry_path(const NodePath &node_path)
{
    this->geometry_path = node_path;
    if (!this->get_geometry_path().is_empty())
    {
        printf("Geometry Path: %s\n", String(this->get_geometry_path()).ptr());
    }
    else
    {
        printf("Geometry Path not set\n");
    }
}

const NodePath &Level3D::get_geometry_path() const
{
    return this->geometry_path;
}

void Level3D::set_player_spawn_point(const NodePath &node_path)
{
    this->player_spawn_point = node_path;
    if (!this->get_player_spawn_point().is_empty())
    {
        printf("Player Spawnpoint: %s\n", String(this->get_player_spawn_point()).ptr());
    }
    else
    {
        printf("Player Spawnpoint not set\n");
    }
}

const NodePath &Level3D::get_player_spawn_point() const
{
    return this->player_spawn_point;
}
} // namespace godot::avalder
