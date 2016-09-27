import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto s = readln.chomp.to!int;
  writefln("%d:%d:%d", s / 3600, s % 3600 / 60, s % 60);
}
