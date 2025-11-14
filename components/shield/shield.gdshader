shader_type canvas_item;

uniform vec4 inner_color : source_color = vec4(0.4, 0.7, 1.0, 0.25);
uniform float tech_speed : hint_range(0.0, 5.0) = 1.2;
uniform float tech_intensity : hint_range(0.0, 1.0) = 0.15;
uniform float edge_feather : hint_range(0.0, 0.05) = 0.01;

void fragment() {
    // Centraliza UV no centro (-1..1)
    vec2 uv = UV * 2.0 - 1.0;
    float dist = length(uv);

    // --- DESCARTA TUDO FORA DO CÍRCULO (sem desenhar nada) ---
    if (dist > 1.0) {
        discard;
    }

    // --- máscara de borda (apenas usada internamente) ---
    float edge = smoothstep(1.0, 1.0 - edge_feather, dist);

    // --- efeitos internos (apenas dentro do círculo, pois fora já foi descartado) ---
    float ripple1 = sin((uv.x * 14.0 + uv.y * 10.0 + TIME * tech_speed)) * tech_intensity;
    float ripple2 = sin((dist * 28.0 - TIME * tech_speed * 2.0)) * (tech_intensity * 0.6);
    float effects = ripple1 + ripple2;

    // --- cor final ---
    vec4 col = inner_color;
    col.a += effects;

    // reforça ligeiramente a opacidade perto da borda (ainda interno)
    col.a *= (1.0 - edge) + 0.2;

    COLOR = col;
}
