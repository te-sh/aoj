import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  string line;
  while ((line = readln) !is null) {
    auto rd = line.split.to!(int[]), a = rd[0], b = rd[1];
    writeln((a + b).numDigits);
  }
}

int numDigits(int n)
{
  auto r = 1;
  for (; n >= 10; n /= 10) ++r;
  return r;
}

unittest
{
  assert(numDigits(0) == 1);
  assert(numDigits(9) == 1);
  assert(numDigits(10) == 2);
  assert(numDigits(99) == 2);
  assert(numDigits(100) == 3);
}
