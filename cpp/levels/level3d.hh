#pragma once

#include <godot_cpp/classes/node3d.hpp>
#include <godot_cpp/variant/node_path.hpp>
#include <godot_cpp/variant/string.hpp>

namespace godot::avalder
{
class Level3D : public Node3D
{
    GDCLASS(Level3D, Node3D)

  private:
    String level_name{"Level Name"};
    NodePath geometry_path{};
    NodePath player_spawn_point{};

  protected:
    static void _bind_methods();

  public:
    Level3D() = default;
    ~Level3D() noexcept override = default;

    void _ready() override;

    void set_level_name(const String &level_name);
    const String &get_level_name() const;
    void set_geometry_path(const NodePath &node_path);
    const NodePath &get_geometry_path() const;
    void set_player_spawn_point(const NodePath &node_path);
    const NodePath &get_player_spawn_point() const;
};
} // namespace godot::avalder
