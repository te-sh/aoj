import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.numeric;

version(unittest) {} else
void main()
{
  auto rd = readln.split.to!(int[]), x = rd[0], y = rd[1];
  writeln(gcd(x, y));
}
