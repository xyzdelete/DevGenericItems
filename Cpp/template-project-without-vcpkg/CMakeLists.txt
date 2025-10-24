# The root CMakeLists.txt file.
cmake_minimum_required(VERSION 4.2.3)

# Uncomment and add vcpkg.json if you would like to use vcpkg
# set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
# CACHE STRING "Vcpkg toolchain file" )

project(
  template-project
  VERSION 1.0.0
  LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD
    23
)
set(CMAKE_CXX_STANDARD_REQUIRED
    ON
)
set(CMAKE_CXX_EXTENSIONS
    OFF
)
set(CMAKE_CXX_SCAN_FOR_MODULES
    ON
)

add_subdirectory(
  src
)

if(UNIX)
  add_custom_target(
    valgrind
    COMMAND
      valgrind --leak-check=full --error-exitcode=1
      $<TARGET_FILE:${CMAKE_PROJECT_NAME}>
    COMMENT "Running valgrind custom target"
    DEPENDS ${CMAKE_PROJECT_NAME}
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    USES_TERMINAL
  )
endif()

add_custom_target(
  cmake_format
  COMMAND
    cmake-format -i ${CMAKE_SOURCE_DIR}/CMakeLists.txt
    ${CMAKE_SOURCE_DIR}/src/CMakeLists.txt
  COMMENT "Running cmake_format custom target"
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  USES_TERMINAL
)

# Ensure cmake_format runs before building the main target across generators.
find_program(
  CMAKE_FORMAT_EXECUTABLE
  cmake-format
)
if(CMAKE_FORMAT_EXECUTABLE)
  add_dependencies(
    ${CMAKE_PROJECT_NAME}
    cmake_format
  )
endif()

# Post build command that launches a program add_custom_command( TARGET
# ${CMAKE_PROJECT_NAME} POST_BUILD COMMAND $<TARGET_FILE:${CMAKE_PROJECT_NAME}>
# )
