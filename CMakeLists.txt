cmake_minimum_required(VERSION 3.4.1)

PROJECT(test_manage)

find_package(CUDA REQUIRED)

ADD_EXECUTABLE(${PROJECT_NAME} main.cpp)

target_include_directories(${PROJECT_NAME}
                            PUBLIC
                            ${CUDA_INCLUDE_DIRS})
TARGET_LINK_LIBRARIES(${PROJECT_NAME}
                      ${PROJECT_SOURCE_DIR}/lib/lib_test.so              
                      ${CUDA_LIBRARIES})
