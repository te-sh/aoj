import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.container, std.typecons;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;

  auto ei = new size_t[][](n);
  foreach (_; n.iota) {
    auto rd = readln.split.to!(size_t[]);
    auto u = rd[0] - 1;
    auto vi = rd[2..$].map!("a - 1").array;
    ei[u] = vi;
  }

  auto li = new int[](n);
  li[] = -1;
  li[0] = 0;

  auto qi = DList!vl(vl(0, 0));
  while (!qi.empty) {
    auto q = qi.front;
    qi.removeFront;

    foreach (u; ei[q.v]) {
      if (li[u] >= 0) continue;
      li[u] = q.l + 1;
      qi.insertBack(vl(u, q.l + 1));
    }
  }

  foreach (i, l; li)
    writefln("%d %d", i + 1, l);
}

alias Tuple!(size_t, "v", int, "l") vl;
