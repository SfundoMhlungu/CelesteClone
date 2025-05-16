in vec2 v_texCoord;
out vec4 fragColor;

uniform sampler2D texture0; // The texture to sample
uniform vec3 color;  // A color to apply to the quad

void main() {
    // Sample from the texture
    vec4 texColor = texture(texture0, v_texCoord);

    // Apply the color (optional)
    fragColor = texColor * vec4(color, 1.0); // Or use texColor directly
}