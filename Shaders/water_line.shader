shader_type canvas_item;

uniform float water_line = 2.15;
uniform float wave_length = 0.5;
uniform float amplitude = 0.1;
uniform float frequency = 2.0;

void fragment() {
	COLOR = texture(TEXTURE, UV);
	if (UV.y * 3.0 >  (sin(UV.x / wave_length + TIME * frequency) * amplitude) + water_line) { // && sin(UV.y) > sin(TIME * 1.0)) {
		COLOR.a = clamp(COLOR.a - (UV.y / 1.5 + 0.07), 0, 1);
//		COLOR.rgb = mix(COLOR.rgb, vec3(0.05, 0.2, 0.2), 0.50);
	}
}