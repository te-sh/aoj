import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto p1 = 0, p2 = 0;

  foreach (_; 0..n) {
    auto rd = readln.split, s1 = rd[0], s2 = rd[1];
    if (s1 == s2) {
      ++p1;
      ++p2;
    } else {
      p1 += (s1 > s2 ? 3 : 0);
      p2 += (s1 < s2 ? 3 : 0);
    }
  }

  writefln("%d %d", p1, p2);
}
