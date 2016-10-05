import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.container;

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

  auto di = new int[](n);
  auto fi = new int[](n);

  auto t = 1;
  for (;;) {
    auto s = di.countUntil!(d => d == 0);
    if (s == -1) break;

    di[s] = t++;

    void dfs(size_t u)
    {
      foreach (v; ei[u]) {
        if (di[v] != 0) continue;
        di[v] = t++;
        dfs(v);
      }
      fi[u] = t++;
    }

    dfs(s);
  }

  foreach (i, d, f; lockstep(di, fi))
    writefln("%d %d %d", i + 1, d, f);
}
