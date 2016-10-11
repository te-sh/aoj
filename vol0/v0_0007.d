import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;
  auto r = 100_000;
  foreach (_; n.iota)
    r = next(r);
  writeln(r);
}

int next(int r)
{
  r = r + r / 20;
  if (r % 1000 > 0)
    return (r / 1000 + 1) * 1000;
  else
    return r / 1000 * 1000;
}

unittest
{
  assert(next(100000) == 105000);
  assert(next(10000) == 11000);
}
