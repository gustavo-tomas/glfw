project "glfw"
    kind "StaticLib"
    language "C"
    staticruntime "On"

    targetdir ("bin/%{cfg.buildcfg}/%{prj.name}")
    objdir ("bin/build/%{prj.name}")

    files
    {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/**.c",
        "src/**.h"
    }

    filter "system:linux"
        pic "On"
        defines { "_GLFW_X11" }

    filter "system:windows"
        systemversion "latest"
        defines { "_GLFW_WIN32", "_CRT_SECURE_NO_WARNINGS" }

    filter "configurations:debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:release"
        runtime "Release"
        optimize "On"
