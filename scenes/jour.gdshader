shader_type canvas_item;

uniform sampler2D gradient : source_color;
uniform float gradient_mix_amount = 1.0;

void fragment() {
	vec4 pixelColor = texture(TEXTURE,UV);
	COLOR = pixelColor;
	COLOR*=vec4(0.8,0.8,0.7,1);
}