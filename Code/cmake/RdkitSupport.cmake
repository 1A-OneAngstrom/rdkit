function(USE_RDKIT target)
    # Locate rdkit_autogen.cpp.in in the RDKit installation directory
    set(RDKIT_AUTOGEN_TEMPLATE "${RDKit_DIR}/Code/cmake/rdkit_autogen.cpp.in")

    # Destination file in the build directory
    set(RDKIT_AUTOGEN_CPP "${CMAKE_CURRENT_BINARY_DIR}/rdkit_autogen.cpp")

    # Copy the template file into the build directory
    configure_file("${RDKIT_AUTOGEN_TEMPLATE}" "${RDKIT_AUTOGEN_CPP}" COPYONLY)

    # Print debug messages
    message(STATUS "RDKit_DIR: ${RDKit_DIR}")
    message(STATUS "Configuring RDKit autogen file: ${RDKIT_AUTOGEN_CPP} from ${RDKIT_AUTOGEN_TEMPLATE}")

    # Check if the file was successfully generated before adding it to the target
    if (EXISTS "${RDKIT_AUTOGEN_CPP}")
        message(STATUS "rdkit_autogen.cpp successfully generated, adding to target: ${target}")
        target_sources(${target} PRIVATE "${RDKIT_AUTOGEN_CPP}")
    else()
        message(WARNING "Failed to generate rdkit_autogen.cpp. RDKit features might not work in ${target}.")
    endif()
endfunction()
