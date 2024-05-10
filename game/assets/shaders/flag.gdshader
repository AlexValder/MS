shader_type spatial;
render_mode cull_disabled,vertex_lighting,blend_mix,depth_draw_opaque;

uniform sampler2D uv_offset_texture;
uniform vec2 uv_offset_scale = vec2(-0.2, -0.1);
uniform vec2 time_scale = vec2(0.3, 0.0);
uniform float face_distortion = 0.5;

instance uniform vec3 color1: source_color = vec3(0.357, 0.808, 0.98);
instance uniform vec3 color2: source_color = vec3(0.961, 0.663, 0.722);
instance uniform vec3 color3: source_color = vec3(1.0, 1.0, 1.0);
instance uniform vec3 color4: source_color = vec3(0.961, 0.663, 0.722);
instance uniform vec3 color5: source_color = vec3(0.357, 0.808, 0.98);

void vertex() {
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
    if (UV.y >= 0.8) {
        ALBEDO.rgb = color1;
    }
    else if (UV.y >= 0.6) {
        ALBEDO.rgb = color2;
    }
    else if (UV.y >= 0.4) {
        ALBEDO.rgb = color3;
    }
    else if (UV.y >= 0.2) {
        ALBEDO.rgb = color4;
    }
    else {
        ALBEDO.rgb = color5;
    }
}