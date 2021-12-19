#define BOOST_TEST_MODULE fib_test
#include <boost/test/unit_test.hpp>
#include <fib.h>

BOOST_AUTO_TEST_CASE(fib_test) {
  BOOST_REQUIRE_EQUAL(fib(0), 0);
  BOOST_REQUIRE_EQUAL(fib(1), 1);
  BOOST_REQUIRE_EQUAL(fib(2), 1);
  BOOST_REQUIRE_EQUAL(fib(3), 2);
  BOOST_REQUIRE_EQUAL(fib(4), 3);
  BOOST_REQUIRE_EQUAL(fib(5), 5);
  BOOST_REQUIRE_EQUAL(fib(6), 8);
  BOOST_REQUIRE_EQUAL(fib(7), 13);
}

BOOST_AUTO_TEST_CASE(fib_negative_argument) {
  BOOST_REQUIRE_EQUAL(fib(-1), 0);
  BOOST_REQUIRE_EQUAL(fib(-2), 0);
  BOOST_REQUIRE_EQUAL(fib(-3), 0);
  BOOST_REQUIRE_EQUAL(fib(-4), 0);
}