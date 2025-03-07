function(USE_RDKIT target)
    if (NOT TARGET_HAS_RDKIT_${target})
        set(TARGET_HAS_RDKIT_${target} TRUE CACHE INTERNAL "Track if ${target} already has RDKit")

        # Correctly locate rdkit_autogen.cpp.in in the same directory as this file (RdkitSupport.cmake)
        set(RDKIT_AUTOGEN_TEMPLATE "${CMAKE_CURRENT_LIST_DIR}/rdkit_autogen.cpp.in")

        # Destination file in the build directory
        set(RDKIT_AUTOGEN_CPP "${CMAKE_CURRENT_BINARY_DIR}/rdkit_autogen.cpp")

        # Copy the template file into the build directory
        configure_file("${RDKIT_AUTOGEN_TEMPLATE}" "${RDKIT_AUTOGEN_CPP}" COPYONLY)

        # Inject the generated source file into the target
        target_sources(${target} PRIVATE "${RDKIT_AUTOGEN_CPP}")
    endif()
endfunction()
