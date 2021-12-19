#include <boost/test/unit_test.hpp>
#include <collatz.h>
#include <iostream>

BOOST_AUTO_TEST_CASE(collatz_test) {
  for (int64_t i = -10000; i < 10000; ++i) {
    std::cout << "collatz(" << i << ") = " << collatz(i) << std::endl;
  }
}