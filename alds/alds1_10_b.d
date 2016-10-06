import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;
  auto rci = iota(n).map!(_ => readln.split.to!(size_t[])).array;

  auto memo = new size_t[][](n, n + 1);
  memo.each!(a => a[] = size_t.max);

  size_t dp(size_t s, size_t t)
  {
    if (memo[s][t] < size_t.max)
      return memo[s][t];

    if (t - s <= 1)
      return 0;

    auto minP = size_t.max;
    foreach (i; s+1..t) {
      auto p = dp(s, i) + dp(i, t) + rci[s][0] * rci[t-1][1] * rci[i][0];
      minP = min(minP, p);
    }

    return memo[s][t] = minP;
  }

  writeln(dp(0, n));
}
