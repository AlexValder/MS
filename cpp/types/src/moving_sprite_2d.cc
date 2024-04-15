#include "../inc/moving_sprite_2d.hh"
#include <godot_cpp/core/class_db.hpp>

namespace godot::avalder
{
    void MovingSprite2D::_bind_methods()
    {
        ClassDB::bind_method(D_METHOD("get_amplitude"), &MovingSprite2D::get_amplitude);
        ClassDB::bind_method(D_METHOD("set_amplitude", "p_amplitude"), &MovingSprite2D::set_amplitude);
        ClassDB::add_property("MovingSprite2D", PropertyInfo(Variant::FLOAT, "amplitude"), "set_amplitude", "get_amplitude");
        ClassDB::bind_method(D_METHOD("get_speed"), &MovingSprite2D::get_speed);
        ClassDB::bind_method(D_METHOD("set_speed", "p_speed"), &MovingSprite2D::set_speed);
        ClassDB::add_property("MovingSprite2D", PropertyInfo(Variant::FLOAT, "speed", PROPERTY_HINT_RANGE, "0,20,0.01"), "set_speed", "get_speed");

        ADD_SIGNAL(MethodInfo("position_changed", PropertyInfo(Variant::OBJECT, "node"), PropertyInfo(Variant::VECTOR2, "new_pos")));
    }

    void MovingSprite2D::_process(double delta)
    {
        time_passed += speed * delta;

        Vector2 new_position = Vector2(
            amplitude + (amplitude * sin(time_passed * 2.0)),
            amplitude + (amplitude * cos(time_passed * 1.5)));

        set_position(new_position);

        time_emit += delta;
        if (time_emit > 1.0)
        {
            emit_signal("position_changed", this, new_position);

            time_emit = 0.0;
        }
    }

    void MovingSprite2D::set_amplitude(const double p_amplitude)
    {
        amplitude = p_amplitude;
    }

    double MovingSprite2D::get_amplitude() const
    {
        return amplitude;
    }

    void MovingSprite2D::set_speed(const double p_speed)
    {
        speed = p_speed;
    }

    double MovingSprite2D::get_speed() const
    {
        return speed;
    }
}
