# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/mtm/cmake-3.17.0-Linux-x86_64/bin/cmake

# The command to remove a file.
RM = /home/mtm/cmake-3.17.0-Linux-x86_64/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/omer_musai/mtm/hw1project/mtm_map

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/omer_musai/mtm/hw1project/build

# Include any dependencies generated for this target.
include CMakeFiles/map.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/map.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/map.dir/flags.make

CMakeFiles/map.dir/map.c.o: CMakeFiles/map.dir/flags.make
CMakeFiles/map.dir/map.c.o: /home/omer_musai/mtm/hw1project/mtm_map/map.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/omer_musai/mtm/hw1project/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/map.dir/map.c.o"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/map.dir/map.c.o   -c /home/omer_musai/mtm/hw1project/mtm_map/map.c

CMakeFiles/map.dir/map.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/map.dir/map.c.i"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/omer_musai/mtm/hw1project/mtm_map/map.c > CMakeFiles/map.dir/map.c.i

CMakeFiles/map.dir/map.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/map.dir/map.c.s"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/omer_musai/mtm/hw1project/mtm_map/map.c -o CMakeFiles/map.dir/map.c.s

# Object files for target map
map_OBJECTS = \
"CMakeFiles/map.dir/map.c.o"

# External object files for target map
map_EXTERNAL_OBJECTS =

map: CMakeFiles/map.dir/map.c.o
map: CMakeFiles/map.dir/build.make
map: CMakeFiles/map.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/omer_musai/mtm/hw1project/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable map"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/map.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/map.dir/build: map

.PHONY : CMakeFiles/map.dir/build

CMakeFiles/map.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/map.dir/cmake_clean.cmake
.PHONY : CMakeFiles/map.dir/clean

CMakeFiles/map.dir/depend:
	cd /home/omer_musai/mtm/hw1project/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/omer_musai/mtm/hw1project/mtm_map /home/omer_musai/mtm/hw1project/mtm_map /home/omer_musai/mtm/hw1project/build /home/omer_musai/mtm/hw1project/build /home/omer_musai/mtm/hw1project/build/CMakeFiles/map.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/map.dir/depend

