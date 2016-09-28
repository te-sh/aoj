import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto ai = readln.split.to!(int[]);
  ai.reverse();
  writeln(ai.to!(string[]).join(" "));
}
