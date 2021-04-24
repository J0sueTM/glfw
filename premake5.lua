--[[
-- file premake5.lua
-- author Josué Teodoro Moreira <jteodomo@gmail.com>
-- date April 07, 2021
--
-- Copyright (C) 2021 Josué Teodoro Moreira 
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--]]

project "GLFW"
  kind "StaticLib"
  language "C"

  targetdir("bin/" .. outputdir .. "-%{prj.name}")
  objdir("bin/obj/" .. outputdir .. "-%{prj.name}")

  files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/glfw_config.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c"
	}
  filter "system:linux"
    pic "On"

    systemversion "latest"
    staticruntime "On"

    files
		{
			"src/x11_init.c",
			"src/x11_monitor.c",
			"src/x11_window.c",
			"src/xkb_unicode.c",
			"src/posix_time.c",
			"src/posix_thread.c",
			"src/glx_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c",
			"src/linux_joystick.c"
		}
		defines
		{ "_GLFW_X11" }
  filter "system:windows"
    systemversion "latest"
    staticruntime "On"

    files
		{
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}
		defines
		{
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

  filter "configurations:Debug"
    runtime "Debug"
    symbols "On"
  filter "configurations:Release"
    runtime "Release"
    optimize "On"
	filter ""
