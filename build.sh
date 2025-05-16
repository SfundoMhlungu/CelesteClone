#!/bin/bash

defines="-DENGINE"
warnings="-Wno-write-strings -Wno-format-security -Wno-deprecated-declarations -Wno-switch"5
timestamp=$(date +%s)

if [[ "$(uname)" == "Linux" ]]; then
    echo "Running on Linux"
    libs="-lX11 -lGL -lfreetype"
    outputFile=og.out

    # fPIC position independent code https://stackoverflow.com/questions/5311515/gcc-fpic-option
    rm -f game_* # Remove old game_* files
    c++ -g "src/main.cpp" -shared -fPIC -o game_$timestamp.so $warnings $defines
    mv game_$timestamp.so game.so

elif [[ "$(uname)" == "Darwin" ]]; then
    echo "Mac is not supported yet!"

else
    echo "Running on Windows"
    libs="-luser32 -lopengl32 -lgdi32 -lole32 -Lthird_party/lib -lfreetype.lib"
    outputFile=schnitzel.exe

    rm -f game_* # Remove old game_* files
    clang++ -g "src/game.cpp" -shared -o game_$timestamp.dll $warnings $defines
    mv game_$timestamp.dll game.dll
fi


c++ $includes -g src/main.cpp -o$outputFile $libs $warnings $defines