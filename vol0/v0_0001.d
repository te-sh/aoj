import std.algorithm, std.conv, std.range, std.stdio, std.string;

const size_t n = 10;

version(unittest) {} else
void main()
{
  auto hi = n.iota.map!(_ => readln.chomp.to!int).array;
  hi.sort!("a > b");
  hi.take(3).each!(writeln);
}
