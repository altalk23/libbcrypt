file(GLOB_RECURSE SRCS "*.c")

if (ENABLE_ASM)
    if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86?)$")
        set(SRCS "${SRCS} crypt_blowfish/x86.S")
    endif()
endif()

include_directories(crypt_blowfish)

add_library(bcrypt_a STATIC ${SRCS})
add_library(bcrypt   SHARED ${SRCS})

include(GNUInstallDirs)

install(TARGETS bcrypt LIBRARY                            DESTINATION ${CMAKE_INSTALL_LIBDIR})
install(FILES   ${CMAKE_CURRENT_BINARY_DIR}/libbcrypt_a.a DESTINATION ${CMAKE_INSTALL_LIBDIR} RENAME libbcrypt.a)
install(FILES   ${CMAKE_CURRENT_SOURCE_DIR}/bcrypt.h      DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
