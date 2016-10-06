import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  for (;;) {
    auto rd = readln.split.to!(int[]), h = rd[0], w = rd[1];
    if (h == 0 && w == 0) break;
    foreach (_; h.iota)
      writeln('#'.repeat(w));
    writeln;
  }
}
