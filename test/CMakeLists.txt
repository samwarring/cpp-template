add_executable(fib_test fib_test.cpp collatz_test.cpp)
target_link_libraries(fib_test PRIVATE math::math Boost::unit_test_framework)
add_test(NAME fib_test COMMAND fib_test)