shader_type canvas_item;

uniform vec4 outline_color : hint_color;

uniform float width = 2.0;
uniform bool enabled = false;

void fragment() {
	float size_x = 1.0 / float(textureSize(TEXTURE, 0).x) * width * float(enabled);
	float size_y= 1.0 / float(textureSize(TEXTURE, 0).y) * width * float(enabled);
	vec4 sprite_color = texture(TEXTURE, UV);
	float alpha = -4.0 * sprite_color.a;
	
	alpha += texture(TEXTURE, UV + vec2(size_x, 0)).a;
	alpha += texture(TEXTURE, UV + vec2(-size_x, 0)).a;
	alpha += texture(TEXTURE, UV + vec2(0, size_y)).a;
	alpha += texture(TEXTURE, UV + vec2(0, -size_y)).a;
	
	vec4 final_color = mix(sprite_color, outline_color, clamp(alpha, 0.0, 1.0));
	
	COLOR = vec4(final_color.rgb, clamp(abs(alpha) + sprite_color.a, 0.0, 1.0));
}