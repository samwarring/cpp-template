add_library(fib fib.cpp)
add_library(fib::fib ALIAS fib)
target_include_directories(fib PUBLIC ../include)