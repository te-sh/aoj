import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;
  auto ai = readln.split.to!(long[]);
  writefln("%d %d %d", ai.reduce!(min), ai.reduce!(max), ai.sum);
}
