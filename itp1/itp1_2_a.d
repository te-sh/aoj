import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto rd = readln.split.to!(int[]), a = rd[0], b = rd[1];
  if (a == b) writeln("a == b");
  else writeln(a > b ? "a > b" : "a < b");
}
