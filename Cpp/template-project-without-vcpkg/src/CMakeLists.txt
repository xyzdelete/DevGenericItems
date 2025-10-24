# Uncomment if your project depends on libraries find_package( <library name>
# CONFIG REQUIRED )

add_executable(
  ${CMAKE_PROJECT_NAME}
)

target_sources(
  ${CMAKE_PROJECT_NAME}
  PRIVATE main.cpp
  PRIVATE FILE_SET
          CXX_MODULES
          FILES
          modules/utilities.ixx
)

# Uncomment if you would like to link libraries target_link_libraries(
# ${CMAKE_PROJECT_NAME} PRIVATE <library name> )
