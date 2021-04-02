include_directories(../lib)

add_definitions(-DTEST_BCRYPT)

add_executable(test test.c)

target_link_libraries(test bcrypt)
target_link_directories(bcrypt PRIVATE ../lib)

execute_process(COMMAND ./bcrypt)
