import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto si = readln.split.to!(int[]);
  auto q = readln.chomp.to!size_t;
  auto ti = readln.split.to!(int[]);
  writeln(ti.count!(t => si.assumeSorted.contains(t)));
}
