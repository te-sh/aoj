import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.typecons;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;

  auto gij = new int[][](n, n);
  foreach (i; n.iota)
    gij[i] = readln.split.to!(int[]);

  edge[] ei;
  foreach (i; 0..n-1)
    foreach (j; i+1..n)
      if (gij[i][j] >= 0)
        ei ~= edge(i, j, gij[i][j]);
  ei.sort!("a.w < b.w");

  auto r = 0;
  auto uf = new UnionFind!size_t(n);
  foreach (e; ei) {
    if (uf.find(e.u) != uf.find(e.v)) {
      uf.unite(e.u, e.v);
      r += e.w;
    }
  }

  writeln(r);
}

alias Tuple!(size_t, "u", size_t, "v", int, "w") edge;

class UnionFind(T)
{
  T[] p; // parent
  T s; // sentinel

  this(T n) {
    p = new T[](n);
    s = n + 1;
    p[] = s;
  }

  T find(T i) {
    if (p[i] == s) {
      return i;
    } else {
      p[i] = find(p[i]);
      return p[i];
    }
  }

  void unite(T i, T j) {
    auto pi = find(i), pj = find(j);
    if (pi != pj) p[pj] = pi;
  }
}
