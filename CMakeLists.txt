cmake_minimum_required(VERSION 3.15)

project ( hello_world_prj )

set ( MY_WORKING_DIR hello_world_prj )

set ( Hello_CMAKE_DIR "${CMAKE_SOURCE_DIR}/cmake")
list( INSERT CMAKE_MODULE_PATH 0 "${Hello_CMAKE_DIR}" )

include ( UtilFunction )
include ( oflDirectories )

add_subdirectory ( codes ${MY_WORKING_DIR} )

