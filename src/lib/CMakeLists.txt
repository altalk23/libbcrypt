file(GLOB_RECURSE SRCS "*.c")

if (BUILD_ASM)
    if ((${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86") OR (${CMAKE_SYSTEM_PROCESSOR} MATCHES "^i[0-9]86$"))
        enable_language(ASM)
        list(APPEND SRCS "${CMAKE_CURRENT_SOURCE_DIR}/crypt_blowfish/x86.S")
        add_definitions("-DBF_ASM=1")
    else()
        add_definitions("-DBF_ASM=0")
    endif()
else()
    add_definitions("-DBF_ASM=0")
endif()

include_directories(crypt_blowfish)

add_library(bcrypt_a STATIC ${SRCS})
add_library(bcrypt   SHARED ${SRCS})

include(GNUInstallDirs)

install(TARGETS bcrypt LIBRARY                            DESTINATION ${CMAKE_INSTALL_LIBDIR})
install(FILES   ${CMAKE_CURRENT_BINARY_DIR}/libbcrypt_a.a DESTINATION ${CMAKE_INSTALL_LIBDIR} RENAME libbcrypt.a)
install(FILES   ${CMAKE_CURRENT_SOURCE_DIR}/bcrypt.h      DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
