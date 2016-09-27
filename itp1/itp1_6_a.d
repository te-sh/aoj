import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto ai = readln.split.map!(to!int).array;
  ai.reverse();
  writeln(ai.map!(to!string).join(" "));
}
