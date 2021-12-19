add_library(math fib.cpp collatz.cpp)
add_library(math::math ALIAS math)
target_include_directories(math PUBLIC ../include)