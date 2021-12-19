#ifndef INCLUDED_COLLATZ_H
#define INCLUDED_COLLATZ_H
#include <cstdint>

/// Returns the number of iterations of the "collatz transformation" until
/// x evaluates to any of {1, 0, -1, -5, -17}, where the transformation is
/// defined by:
///     if x is even:
///         x = x/2
///     else:
///         x = 3x+1
uint64_t collatz(int64_t x);

#endif
