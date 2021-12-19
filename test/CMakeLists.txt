add_executable(fib_test fib_test.cpp)
target_link_libraries(fib_test PRIVATE fib::fib Boost::unit_test_framework)
add_test(NAME fib_test COMMAND fib_test)