

shader_type canvas_item;

uniform bool day ; 

void fragment() {
	vec4 pixelColor = texture(TEXTURE,UV);
	COLOR = pixelColor;
	if (!day) {
		COLOR.rgb = COLOR.rrr;
		COLOR*=vec4(0.35,0.45,0.75,1);
	}
		
}
