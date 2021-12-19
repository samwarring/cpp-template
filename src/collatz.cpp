#include <collatz.h>

uint64_t collatz(int64_t x) {
  uint64_t iters = 0;
  while (x != 1 && x != 0 && x != -1 && x != -5 && x != -17) {
    if (x % 2 == 0) {
      x = x / 2;
    } else {
      x = 3 * x + 1;
    }
    iters++;
  }
  return iters;
}