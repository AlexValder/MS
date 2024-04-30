shader_type spatial;
render_mode blend_mix,depth_draw_opaque,cull_disabled,diffuse_burley,specular_schlick_ggx;
uniform sampler2D uv_offset_texture;
uniform vec2 uv_offset_scale = vec2(-0.2, -0.1);
uniform vec2 time_scale = vec2(0.3, 0.0);
uniform float face_distortion = 0.5;
uniform vec3 color1: source_color = vec3(1.0, 1.0, 0.0);
uniform vec3 color2: source_color = vec3(1.0, 0.0, 0.0);
uniform vec3 color3: source_color = vec3(1.0, 1.0, 1.0);

void vertex(){
    vec2 base_uv_offset = UV * uv_offset_scale + TIME * time_scale;

    float noise = texture(uv_offset_texture, base_uv_offset).r;
    float texture_based_offset = (noise * 2.0 - 1.0)/2.0;
    texture_based_offset *= UV.x;

    VERTEX.y += texture_based_offset;
    // Distort the face to give impression of conserving shape
    VERTEX.z += texture_based_offset * face_distortion;
    VERTEX.x += texture_based_offset * -face_distortion;
}

void fragment() {
    if (UV.y < 0.2 || UV.y > 0.8) {
        ALBEDO.rgb = color1;
    }
    else if (UV.y < 0.4 || UV.y > 0.6) {
        ALBEDO.rgb = color2;
    } else {
        ALBEDO.rgb = color3;
    }
}
