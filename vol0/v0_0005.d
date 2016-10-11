import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.numeric;

version(unittest) {} else
void main()
{
  string line;
  while ((line = readln) !is null) {
    auto rd = line.split.to!(int[]), a = rd[0], b = rd[1];
    auto g = gcd(a, b);
    writefln("%d %d", g, a / g * b);
  }
}
