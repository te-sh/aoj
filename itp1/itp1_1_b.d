import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto x = readln.chomp.to!int;
  writeln(x ^^ 3);
}
