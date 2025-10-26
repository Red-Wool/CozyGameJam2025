shader_type canvas_item;

uniform sampler2D noiseTexture : repeat_enable;
uniform float windCurrents;

void vertex() {
	// Called for every vertex the material is visible on.
}

float rand(float x){
	return fract(sin(x*42.23)*935.24);
}

float noise(float x){
	float a = rand(floor(x));
	float b = rand(floor(x)+1.);
	return mix(a,b,fract(x));
}

void fragment() {
	vec2 uv = UV;
	uv.x += rand(uv.y*10.+uv.x*10.+TIME)*.01;
	uv.y += rand(uv.y*1.+uv.x*1.+TIME)*.1;
	uv.x = uv.x * windCurrents;
	float i = floor(uv.x);
	uv.x = fract(uv.x);
	uv.x -= .5;
	
	//uv.y += sin(uv.y*10.+i*142.42)*.5;
	uv.y += noise(i);
	vec3 col = vec3(noise(i*420.69+TIME)*.5+.5); //Im very funny
	col += texture(noiseTexture, UV*5.+(vec2(sin(-UV.y*10. + TIME*2.)*.0001,1))*TIME*.5).rgb;
	//col -= texture(noiseTexture, UV*2.+(vec2(sin(-UV.y*1. + TIME*.1)*.00001,1))*TIME*1.).rgb*.2;
	uv.y += TIME*(rand(i)+2.5);
	float a = fract(uv.y*.3-abs(uv.x)*.01)*.5;
	a += texture(noiseTexture, UV*.4+vec2(0,1)*TIME*.1).x;
	a *= 1.-(abs(UV.x-.5)*2.);
	a *= pow(1.-(abs(UV.y-.5)*2.),1.);
	
	
	COLOR = vec4(col,a);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
