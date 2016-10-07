import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;
  foreach (_; n.iota) {
    auto rd = readln.split.to!(int[]);
    writeln(isRightTriangle(rd[0], rd[1], rd[2]) ? "YES" : "NO");
  }
}

bool isRightTriangle(int a, int b, int c)
{
  return
    a ^^ 2 == b ^^ 2 + c ^^ 2 ||
    b ^^ 2 == c ^^ 2 + a ^^ 2 ||
    c ^^ 2 == a ^^ 2 + b ^^ 2;
}

unittest
{
  assert(isRightTriangle(3, 4, 5));
  assert(isRightTriangle(5, 3, 4));
  assert(isRightTriangle(4, 3, 5));
  assert(!isRightTriangle(4, 3, 6));
}
