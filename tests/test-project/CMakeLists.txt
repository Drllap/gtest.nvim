cmake_minimum_required(VERSION 3.26.4)

project(gtest-nvim-test CXX)
add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME}
  PRIVATE
    main.cpp
    some-tests.cpp
)

find_package(GTest REQUIRED)

target_link_libraries(${PROJECT_NAME}
  PRIVATE
    GTest::GTest
)

set_target_properties(${PROJECT_NAME} PROPERTIES CXX_STANDARD 20)

