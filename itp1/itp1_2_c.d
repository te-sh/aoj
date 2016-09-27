import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto ai = readln.split.map!(to!int).array.sort();
  writeln(ai.map!(to!string).join(" "));
}
