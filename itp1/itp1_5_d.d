import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!int;

  foreach (i; 1..n+1)
    if (i % 3 == 0 || include3(i))
      writef(" %d", i);
  writeln;
}

bool include3(int x)
{
  for (; x > 0; x /= 10)
    if (x % 10 == 3) return true;
  return false;
}

unittest
{
  assert(include3(3));
  assert(!include3(4));
  assert(include3(13));
  assert(!include3(24));
  assert(include3(31));
}
