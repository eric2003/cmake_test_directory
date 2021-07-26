function ( ConstructSolutionDirTree currdir my_head_list my_src_list my_include_dirs )
    set ( tmp_header_list  "" )
    set ( tmp_src_list     "" )
    set ( tmp_include_dirs "" )

    message ( STATUS "The currdir is ${currdir}" )
    file ( GLOB_RECURSE FOUND_FILES LIST_DIRECTORIES true RELATIVE ${currdir} * )

    message( STATUS "Files are ${FOUND_FILES}" )

    foreach ( child ${FOUND_FILES} )
        set( candidate_dir ${currdir}/${child} )
        if ( IS_DIRECTORY ${candidate_dir} )
            message ( STATUS "The ${candidate_dir} is DIRECTORY" )
            file ( GLOB header_files "${candidate_dir}/*.h" )
            file ( GLOB src_files    "${candidate_dir}/*.cpp" )
            file ( GLOB hpp_files    "${candidate_dir}/*.hpp" )
            
            list ( APPEND header_files ${hpp_files} )
            
            list ( LENGTH header_files n_header_files )
            #message ( STATUS "The n_header_files is ${n_header_files}" )
            if ( NOT ( ${n_header_files} EQUAL 0 ) )
                list ( APPEND tmp_include_dirs ${candidate_dir} )
            endif()
            
            source_group ( "${child}" FILES ${header_files} )
            source_group ( "${child}" FILES ${src_files}    )
            
            list ( APPEND tmp_header_list ${header_files} )
            list ( APPEND tmp_src_list  ${src_files} )
        
            message ( STATUS "The header_files is ${header_files}" )
            message ( STATUS "The src_files is ${src_files}" )
        endif()
    endforeach()
    set ( ${my_head_list} ${tmp_header_list} PARENT_SCOPE )
    set ( ${my_src_list} ${tmp_src_list} PARENT_SCOPE )
    set ( ${my_include_dirs} ${tmp_include_dirs} PARENT_SCOPE ) 
endfunction()

