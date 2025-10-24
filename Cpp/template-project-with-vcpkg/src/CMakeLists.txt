find_package(
  fmt
  CONFIG
  REQUIRED
)

find_package(
  Boost
  CONFIG
  REQUIRED
  COMPONENTS system
             filesystem
)

add_executable(
  ${CMAKE_PROJECT_NAME}
)

target_sources(
  ${CMAKE_PROJECT_NAME}
  PRIVATE main.cpp
  PRIVATE FILE_SET
          HEADERS
          FILES
          headers/utilities.hpp
  PRIVATE FILE_SET
          CXX_MODULES
          FILES
          modules/utilities.ixx
)

target_include_directories(
  ${CMAKE_PROJECT_NAME}
  PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/headers
)

target_link_libraries(
  ${CMAKE_PROJECT_NAME}
  PRIVATE fmt::fmt
          Boost::system
          Boost::filesystem
)
