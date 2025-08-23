shader_type canvas_item;


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float conversion = mod(TIME/100.,1) -.5;
	float simulated = (.5 - conversion);
	simulated = simulated* (simulated);
	float actual = abs(.5 - simulated);

	vec2 pixel = mod(UV + vec2(-actual,actual),1);
	COLOR = texture(TEXTURE, pixel*10.);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
