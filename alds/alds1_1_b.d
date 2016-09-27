import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.numeric;

void main()
{
  auto rd = readln.split.map!(to!int), x = rd[0], y = rd[1];
  writeln(gcd(x, y));
}
