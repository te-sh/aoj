import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  for (;;) {
    auto rd = readln.split.to!(int[]), n = rd[0], x = rd[1];
    if (n == 0 && x == 0) break;

    auto r = 0;
    foreach (i; 1..n+1)
      foreach (j; i+1..n+1) {
        auto k = x - i - j;
        if (k > j && k <= n) ++r;
      }

    writeln(r);
  }
}
