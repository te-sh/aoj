import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;

  auto gij = new int[][](n, n);
  foreach (_; n.iota) {
    auto rd = readln.split.to!(size_t[]);
    auto u = rd[0] - 1;
    auto vi = rd[2..$].map!("a - 1").array;

    foreach (v; vi) gij[u][v] = 1;
  }

  gij.each!(gi => writeln(gi.to!(string[]).join(" ")));
}
