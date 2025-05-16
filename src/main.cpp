#include "schnitzel_lib.h"

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

int main()
{
    if (!platform_create_window(400, 800, "og"))
        return 1;
    while(running){
        SM_TRACE("TEST");
        SM_WARN("TEST");
        SM_ERROR("TEST");
    }

    return 0;
}