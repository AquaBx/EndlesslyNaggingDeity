

shader_type canvas_item;

uniform bool day ;
uniform sampler2D mask;

void fragment() {
	vec4 pixelColor = texture(TEXTURE,UV);
	vec4 maskValue = texture(mask, UV);
	COLOR = pixelColor;
	
	if (maskValue.a == 1.0){}
	else if ( !day ) {
		COLOR.rgb = COLOR.rrr;
		COLOR*=vec4(0.35,0.45,0.75,1);
	}
}
