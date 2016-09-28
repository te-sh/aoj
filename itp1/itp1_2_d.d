import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto rd = readln.split.to!(int[]);
  auto w = rd[0], h = rd[1], x = rd[2], y = rd[3], r = rd[4];
  writeln(x >= r && x <= w - r && y >= r && y <= h - r ? "Yes" : "No");
}
