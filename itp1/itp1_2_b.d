import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto rd = readln.split.to!(int[]), a = rd[0], b = rd[1], c = rd[2];
  writeln(a < b && b < c ? "Yes" : "No");
}
