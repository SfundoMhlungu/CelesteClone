#include "schnitzel_lib.h"
#include "input.h"
#include "platform.h"
#define GL_GLEXT_PROTOTYPES
#include "glcorearb.h"


#ifdef _WIN32
#include "win32_platform.cpp"
const char *gameLibName = "game.dll";
const char *gameLoadLibName = "game_load.dll";
#elif defined(__APPLE__)
#include "mac_platform.cpp"
const char *gameLibName = "game.so"; // ?????
const char *gameLoadLibName = "game_load.so";
#else // Linux
#include "linux_platform.cpp"
const char *gameLibName = "game.so";
const char *gameLoadLibName = "game_load.so";
#endif

#include "gl_renderer.cpp"
int main()
{

    BumpAllocator transientStorage = make_bump_allocator(MB(50));
    if (!platform_create_window(400, 800, "og"))
        return 1;

    gl_init(&transientStorage);
    while(running){
        SM_TRACE("TEST");
        SM_WARN("TEST");
        SM_ERROR("TEST");
        gl_render(&transientStorage);
    }

    return 0;
}