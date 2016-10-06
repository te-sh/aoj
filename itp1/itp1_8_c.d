import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.uni;

version(unittest) {} else
void main()
{
  auto hi = new int[](26);

  for (;;) {
    auto s = readln;
    if (!s) break;

    foreach (c; s.chomp)
      if (c.isLower) ++hi[c - 'a'];
      else if (c.isUpper) ++hi[c - 'A'];
  }

  foreach (dchar i; 0..26)
    writefln("%c : %d", dchar(i + 'a'), hi[i]);
}
