import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto w = readln.chomp;
  auto r = 0;

  for (;;) {
    auto t = readln.chomp;
    if (t == "END_OF_TEXT") break;
    auto ti = t.split;
    r += ti.count!(a => icmp(a, w) == 0);
  }

  writeln(r);
}
