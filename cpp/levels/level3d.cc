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
}

void Level3D::_ready()
{
    printf("test");
}

/// @brief
/// @param p_name
void Level3D::set_level_name(const String &p_name)
{
    this->level_name = p_name;
}

/// @brief
/// @return
const String &Level3D::get_level_name() const
{
    return this->level_name;
}
} // namespace godot::avalder
