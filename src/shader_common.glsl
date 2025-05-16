// shader_common.glsl

// Bit helper
#define BIT(i) (1 << (i))

// Rendering options must be `const` at global scope in GLSL:
const int RENDERING_OPTION_FLIP_X = BIT(0);
const int RENDERING_OPTION_FLIP_Y = BIT(1);
const int RENDERING_OPTION_FONT   = BIT(2);

// GLSL types—never use your C++ Vec2/Vec4 typedefs here
struct Transform {
    vec2 pos;
    vec2 size;
    ivec2 atlasOffset;
    ivec2 spriteSize;
    int    renderOptions;
    int    materialIdx;
    float  layer;
    // pad if you really need alignment, but GLSL std430 will pack for you
};

struct Material {
    vec4 color;
};
