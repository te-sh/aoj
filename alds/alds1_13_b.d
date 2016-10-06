import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.container, std.typecons;

const auto n = 3;
const auto bits = 4;

version(unittest) {} else
void main()
{
  auto b = 0UL;
  foreach (i; 0..n) {
    auto rd = readln.split.to!(int[]);
    foreach (j, d; rd)
      b = b.setDigit(i * n + j, d);
  }

  auto g = goal;

  auto vi = [b: true];
  auto qi = new DList!bl(bl(b, 0));
  while (!qi.empty) {
    auto q = qi.front; qi.removeFront;
    if (q.b == g) {
      writeln(q.l);
      break;
    }
      
    auto i = q.b.findZero;

    void insertQueue(bl q, size_t j)
    {
      auto c = q.b.swapDigit(i, j);
      if (c !in vi) {
        qi.insertBack(bl(c, q.l + 1));
        vi[c] = true;
      }
    }

    if (i / n > 0)     insertQueue(q, i - n);
    if (i / n < n - 1) insertQueue(q, i + n);
    if (i % n > 0)     insertQueue(q, i - 1);
    if (i % n < n - 1) insertQueue(q, i + 1);
  }
}

alias Tuple!(ulong, "b", int, "l") bl;

ulong goal()
{
  auto r = 0UL;
  foreach (i; 0..n*n-1)
    r = r.setDigit(i, i + 1);
  return r;
}

ulong setDigit(ulong b, size_t i, int val)
{
  return b & (~(((1UL << bits) - 1) << i * bits)) | (val.to!ulong << i * bits);
}

int digit(ulong b, size_t i)
{
  return (b >> i * bits) & ((1UL << bits) - 1);
}

ulong swapDigit(ulong b, size_t i, size_t j)
{
  auto x = b.digit(i), y = b.digit(j);
  return b.setDigit(i, y).setDigit(j, x);
}

ptrdiff_t findZero(ulong b)
{
  foreach (i; 0..n*n)
    if (b.digit(i) == 0)
      return i;
  return -1;
}
