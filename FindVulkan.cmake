# ┌─┐┬ ┬┬─┐┌─┐┬─┐┌─┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┬ ┬┌─┐┬─┐┬┌─
# ├─┤│ │├┬┘│ │├┬┘├─┤  ├┤ ├┬┘├─┤│││├┤ ││││ │├┬┘├┴┐
# ┴ ┴└─┘┴└─└─┘┴└─┴ ┴  └  ┴└─┴ ┴┴ ┴└─┘└┴┘└─┘┴└─┴ ┴
# A Powerful General Purpose Framework
# More information in: https://aurora-fw.github.io/
#
# Copyright (c) 2017 GLFW (@elmindreda & @srjek, github.com/glfw/glfw)
# Copyright (c) 2017 Aurora Framework, All rights reserved.
#
# This file is part of the Aurora Framework. This framework is free
# software; you can redistribute it and/or modify it under the terms of
# the GNU Lesser General Public License version 3 as published by the
# Free Software Foundation and appearing in the file LICENSE included in
# the packaging of this file. Please review the following information to
# ensure the GNU Lesser General Public License version 3 requirements
# will be met: https://www.gnu.org/licenses/lgpl-3.0.html.

# Find Vulkan
#
# VULKAN_INCLUDE_DIR
# VULKAN_LIBRARY
# VULKAN_FOUND

if (WIN32)
	find_path(VULKAN_INCLUDE_DIR NAMES vulkan/vulkan.h HINTS
		"$ENV{VULKAN_SDK}/Include"
		"$ENV{VK_SDK_PATH}/Include")
	if (CMAKE_SIZEOF_VOID_P EQUAL 8)
		find_library(VULKAN_LIBRARY NAMES vulkan-1 HINTS
			"$ENV{VULKAN_SDK}/Lib"
			"$ENV{VULKAN_SDK}/Bin"
			"$ENV{VK_SDK_PATH}/Bin")
		find_library(VULKAN_STATIC_LIBRARY NAMES vkstatic.1 HINTS
			"$ENV{VULKAN_SDK}/Lib"
			"$ENV{VULKAN_SDK}/Bin"
			"$ENV{VK_SDK_PATH}/Bin")
	else()
		find_library(VULKAN_LIBRARY NAMES vulkan-1 HINTS
			"$ENV{VULKAN_SDK}/Lib32"
			"$ENV{VULKAN_SDK}/Bin32"
			"$ENV{VK_SDK_PATH}/Bin32")
		find_library(VULKAN_STATIC_LIBRARY NAMES vkstatic.1 HINTS
			"$ENV{VULKAN_SDK}/Lib32"
			"$ENV{VULKAN_SDK}/Bin32"
			"$ENV{VK_SDK_PATH}/Bin32")
	endif()
elseif (APPLE)
	find_library(VULKAN_LIBRARY vulkan.1 HINTS
		"$ENV{VULKAN_SDK}/macOS/lib")
	find_path(VULKAN_INCLUDE_DIR NAMES vulkan/vulkan.h HINTS
		"$ENV{VULKAN_SDK}/macOS/include")
else()
	find_path(VULKAN_INCLUDE_DIR NAMES vulkan/vulkan.h HINTS
		"$ENV{VULKAN_SDK}/include")
	find_library(VULKAN_LIBRARY NAMES vulkan HINTS
		"$ENV{VULKAN_SDK}/lib")
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Vulkan DEFAULT_MSG VULKAN_LIBRARY VULKAN_INCLUDE_DIR)

mark_as_advanced(VULKAN_INCLUDE_DIR VULKAN_LIBRARY VULKAN_STATIC_LIBRARY)

