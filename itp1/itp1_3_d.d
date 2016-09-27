import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto rd = readln.split.map!(to!int), a = rd[0], b = rd[1], c = rd[2];
  auto r = iota(a, b+1).count!(i => c % i == 0);
  writeln(r);
}
