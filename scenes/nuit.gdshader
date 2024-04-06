

shader_type canvas_item;

void fragment() {
	vec4 pixelColor = texture(TEXTURE,UV);
	COLOR = pixelColor;
	COLOR.rgb = COLOR.rrr;
	COLOR*=vec4(0.2,0.6,1,1);
}
