#include "spawnpoint.hh"

namespace godot::avalder
{

int Spawnpoint::global_index = 0;

void Spawnpoint::_bind_methods()
{
}

Spawnpoint::Spawnpoint() : index(global_index++)
{
    printf("Created Spawnpoint #%d\n", index);
    printf("GlobalIndex is %d\n", Spawnpoint::global_index);
}

Spawnpoint::~Spawnpoint() noexcept
{
    printf("Deleted Spawnpoint #%d\n", index);
    printf("GlobalIndex is %d\n", Spawnpoint::global_index);
}
} // namespace godot::avalder
