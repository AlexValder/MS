#pragma once

#include <godot_cpp/classes/sprite2d.hpp>

namespace godot::avalder
{
    class MovingSprite2D : public Sprite2D
    {
        GDCLASS(MovingSprite2D, Sprite2D)

    private:
        double time_passed{};
        double time_emit{};
        double amplitude{10.0};
        double speed{1.0};

    protected:
        static void _bind_methods();

    public:
        MovingSprite2D() = default;
        ~MovingSprite2D() = default;

        void _process(double delta) override;

        void set_amplitude(const double p_amplitude);
        double get_amplitude() const;
        void set_speed(const double p_speed);
        double get_speed() const;
    };
}
