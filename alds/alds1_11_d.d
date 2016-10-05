import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto rd1 = readln.split.to!(size_t[]), n = rd1[0], m = rd1[1];

  auto uf = new UnionFind!size_t(n);
  foreach (_1; m.iota) {
    auto rd2 = readln.chomp.splitter(' ');
    auto s = rd2.front.to!size_t; rd2.popFront;
    auto t = rd2.front.to!size_t;
    uf.unite(s, t);
  }

  auto q = readln.chomp.to!size_t;
  foreach (_2; q.iota) {
    auto rd2 = readln.chomp.splitter(' ');
    auto s = rd2.front.to!size_t; rd2.popFront;
    auto t = rd2.front.to!size_t;
    writeln(uf.find(s) == uf.find(t) ? "yes" : "no");
  }
}

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
