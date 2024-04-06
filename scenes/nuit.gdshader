

shader_type canvas_item;

void fragment() {
	vec4 pixelColor = texture(TEXTURE,UV);
	COLOR = pixelColor;
	COLOR.rgb = COLOR.rrr;
	COLOR*=vec4(0.35,0.45,0.75,1);
}
