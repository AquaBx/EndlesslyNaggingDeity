shader_type canvas_item;

uniform sampler2D gradient;

void fragment()
{
	vec4 pixelColor  = texture(TEXTURE, UV);
	vec4 gradientColor = texture(gradient,UV);
    COLOR += gradientColor;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
