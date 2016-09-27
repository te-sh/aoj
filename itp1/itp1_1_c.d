import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto rd = readln.split.map!(to!int), a = rd[0], b = rd[1];
  writefln("%d %d", a * b, 2 * (a + b));
}
