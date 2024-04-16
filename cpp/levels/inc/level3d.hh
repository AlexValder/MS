#pragma once

#include <godot_cpp/classes/node3d.hpp>
#include <godot_cpp/variant/string.hpp>

namespace godot::avalder
{
class Level3D : public Node3D
{
    GDCLASS(Level3D, Node3D);

  private:
    String level_name{"Level Name"};

  protected:
    static void _bind_methods();

  public:
    Level3D() = default;
    ~Level3D() = default;

    void _ready() override;

    void set_level_name(const String &level_name);
    const String &get_level_name() const;
};
} // namespace godot::avalder
