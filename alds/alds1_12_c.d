import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.container, std.typecons;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;
  auto eij = new DList!edge[](n);

  foreach (_1; n.iota) {
    auto rd = readln.splitter;
    auto i = rd.front.to!size_t; rd.popFront;
    auto k = rd.front.to!size_t; rd.popFront;
    foreach (_2; k.iota) {
      auto v = rd.front.to!size_t; rd.popFront;
      auto c = rd.front.to!int; rd.popFront;
      eij[i].insertBack(edge(v, c));
    }
  }

  auto wi = dijkstra(n, eij, 0);
  foreach (i, w; wi)
    writefln("%d %d", i, w);
}

alias Tuple!(size_t, "v", int, "w") edge;

int[] dijkstra(size_t n, DList!edge[] eij, size_t s)
{
  auto wi = new int[](n);
  wi[] = -1;

  auto bi = new edge[](1_000_000);
  bi[0] = edge(s, 0);
  auto hi = bi.heapify!("a.w > b.w")(1);

  while (!hi.empty) {
    auto es = hi.front; hi.removeFront;
    if (wi[es.v] >= 0) continue;
    wi[es.v] = es.w;

    foreach (et; eij[es.v]) {
      if (wi[et.v] >= 0) continue;
      wi[et.v] = min(wi[et.v], es.w + et.w);
      hi.insert(edge(et.v, es.w + et.w));
    }
  }

  return wi;
}
