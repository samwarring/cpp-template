#include <cpp_template.h>

int fib(int n) {
  if (n <= 0) {
    return 0;
  } else if (n <= 2) {
    return 1;
  }
  int prev2 = 1;
  int prev1 = 1;
  int curr = 2;
  for (n -= 3; n > 0; --n) {
    prev2 = prev1;
    prev1 = curr;
    curr = prev2 + prev1;
  }
  return curr;
}