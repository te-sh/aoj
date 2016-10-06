import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  for (auto i = 1; ; ++i) {
    auto x = readln.chomp.to!int;
    if (x == 0) break;
    writefln("Case %d: %d", i, x);
  }
}
