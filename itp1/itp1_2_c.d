import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto ai = readln.split.to!(int[]).sort();
  writeln(ai.to!(string[]).join(" "));
}
