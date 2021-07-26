set ( my_compile_def "" )
set ( my_libraries "" )
set ( my_include_dirs "" )

if ( CMAKE_SYSTEM_NAME MATCHES "Linux" )
elseif( CMAKE_SYSTEM_NAME MATCHES "Windows" )
    list( APPEND my_compile_def _CRT_SECURE_NO_WARNINGS )
endif()

ConstructSolutionDirTree( ${CMAKE_CURRENT_SOURCE_DIR} my_head_list my_src_list local_include_dirs )
list ( APPEND my_include_dirs ${local_include_dirs} )

set ( Hello_EXE "${CMAKE_PROJECT_NAME}" )
message ( STATUS "The executable name is ${Hello_EXE}." )

add_executable( ${Hello_EXE} ${my_src_list} ${my_head_list} )

target_include_directories( ${Hello_EXE}
    PRIVATE 
        ${my_include_dirs}
)

target_link_libraries( ${Hello_EXE} 
    PRIVATE 
        ${my_libraries}
)

target_compile_definitions( ${Hello_EXE}
    PRIVATE
       ${my_compile_def} 
)
