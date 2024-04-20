#pragma once

#include <godot_cpp/classes/marker3d.hpp>

namespace godot::avalder
{
class Spawnpoint : public Marker3D
{
    GDCLASS(Spawnpoint, Marker3D)

  private:
    static int global_index;
    int index;

  protected:
    static void _bind_methods();

  public:
    Spawnpoint();
    ~Spawnpoint() noexcept override;
};
} // namespace godot::avalder
