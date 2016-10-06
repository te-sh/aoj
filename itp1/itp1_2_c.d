import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto ai = readln.split.to!(int[]);
  ai.sort();
  writeln(ai.to!(string[]).join(" "));
}
